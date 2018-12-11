From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Dec 2018 22:57:39 +0100
Subject: [Buildroot] [PATCH 1/1] ccid: fix build with pkgconf 1.5.3
In-Reply-To: <20181211185514.GM3383@scaer>
References: <20181211172124.30082-1-fontaine.fabrice@gmail.com>
 <d8aca54b-9283-d230-e3ba-7cbba7472ddd@mind.be> <20181211185514.GM3383@scaer>
Message-ID: <8ff6fe47-bbcf-caeb-59cf-72db797cf00b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/12/2018 19:55, Yann E. MORIN wrote:
> Arnout, Fabrice,
> 
> On 2018-12-11 19:21 +0100, Arnout Vandecappelle spake thusly:
>> On 11/12/2018 18:21, Fabrice Fontaine wrote:
>>> Do not add DESTDIR before usbdropdir to install pcsc drivers in
>>> src/Makefile.am.
>>>
>>> Indeed, usbdropdir is retrieved from libpcsc.pc and can be prefixed by
>>> sysroot, so it can can be set for example to:
>>> usbdropdir='/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/pcsc/drivers'
>>>
>>> If DESTDIR is added before usbdropdir, files will be installed in a
>>> wrong directory and build will fail
>>
>>  I have the feeling this is not the right fix. I think the problem really is
>> that pkg-config should prefix usbdropdir with sysroot. To me it seems that the
>> right thing to do is to add the sysroot to -L and -I flags, but not to add it to
>> random variables...
>>
>>  Maybe other people who have a better understanding of how pkg-config is
>> supposed to work can shed some light?
> 
> Indeed, we must be careful with how we handle pkg-config.
> 
> For this specific case, I agree with Arnout: installing a file should
> always be prefixed by DESTDIR. We should not change that part of a
> package installation.

 Especially because it is *wrong*, because the files will not be installed in
target...

> 
> There are two conflicting needs: to know where the files are at build
> time, and to know where they are at runtime.
> 
> With pkg-config, there is a mix of both concepts, and they are
> absolutely not differentiated. That's probably because pkg-config was
> initially made to be able to provide build-time-only files: headers and
> libs. But packages (ab)used it to also store and share arbitrary
> variables, and they expect those locations to be valid both at build
> time and runtime, which is wrong, as we can see in a lot of cases, such
> as this one...
> 
> Before we bumped pkg-config, we had a patch that would make it prefix
> a set of carefully selected variables (instead of just -I and -L). But
> that was probably goign to be an endless whack-a-mole game, and upstream
> decided to now prefix all variables (again, instead of only -I and -L).
> 
> However, I have no good idea on how to solve this situation in a generic
> way.

 I don't even know how to do it in a specific way :-)

 I poked around a bit in pkgconf sources, and this is the fragment that adds the
sysroot:

         if (*value == '/' && client->sysroot_dir != NULL && strncmp(value,
client->sysroot_dir, strlen(client->sysroot_dir)))
                 bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);


 This is done unconditionally as far as I can see...

 So I see a couple of possibilities...

1. Patch pkgconf to add the sysroot only for a whitelisted set of keys.

2. Mark the not-to-be-prefixed variables in the .pc file in some way, and
interpret that mark in pkgconf.

3. Make sure the value in the .pc file doesn't start with / - since there will
always be a DESTDIR prefixed to it, we can just make DESTDIR end with /.

4. Do some argument munging in the pkg-config wrapper script and don't set
PKG_CONFIG_SYSROOT_DIR if some random variable is requested - probably we
capture almost all broken cases by just matching --variable= in the argument list.


 I can't say I really like any of these solutions though...

 Regards,
 Arnout

From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Dec 2019 09:58:15 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <20191206085900.6df9f25a@windsurf>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
 <20191206085900.6df9f25a@windsurf>
Message-ID: <74d445b1-0c5b-95d0-652b-7f403e9ccff0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/12/2019 08:59, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 5 Dec 2019 23:13:42 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> -TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
>>> +TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF  
>>
>>  Note that this essentially reverts [1].
> 
> Yes, true.
> 
>>  The case for that patch was not terribly strong, so it should be OK. But then
>> again, the case for this patch is not that strong either.
> 
> Well, the case for my patch is that it allows to produce a meson
> cross-compilation.conf that has correct and usable values at the end of
> the build.
> 
>>  Note that pkg-cmake has the same issue.

 Now that I'm awake again (<grin>) I see that it actually doesn't, because that
one uses relative paths. I don't suppose that meson's cross-compilation.conf can
use a similar trick? (Adding meson "experts" in Cc...)

>> And a number of other packages as well,
>> e.g. the Python sysconfig refers to the Python per-package dirs.
> 
> For sysconfig, I have a pending patch that I will submit soon to fix
> the problem. It is in fact worse for sysconfig because if you don't
> tweak it during the build, the build simply fails. While for the global
> meson cross-compilation.conf, it is less dramatic as it is not used by
> Buildroot itself, just provided as a convenience.

 Just to be entirely clear: it actually works as long as you keep the build
directory around, it just doesn't work in the context of the SDK, right?

 Regards,
 Arnout

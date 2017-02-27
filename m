From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Feb 2017 10:32:27 +0100
Subject: [Buildroot] [PATCH/next v2] linux: preserve VCS info when using
 OVERRIDE_SRCDIR
In-Reply-To: <20170226215401.3426a670@free-electrons.com>
References: <20170224230610.23747-1-arnout@mind.be>
 <20170226215401.3426a670@free-electrons.com>
Message-ID: <13aaabf1-de09-77c0-c2fc-73346b666f9a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-02-17 21:54, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 25 Feb 2017 00:06:10 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> The Linux build system will try to include VCS information into the
>> kernel version. This is very convenient when developing to be sure
>> you're looking at the right kernel.
>>
>> However, since Buildroot rsyncs everything to the build directory,
>> but leaves the .git directory behind, this version information is
>> lost.
>>
>> Fortunately, the kernel's setlocalversion script supports this kind
>> of situation: it can save the VCS info in a file ".scmversion" and
>> use that during the build. Calling the script with --save-scmversion
>> will create .scmversion.
>>
>> The --save-scmversion option exists since v2.6.35. On older kernels,
>> we just ignore the error. It can be assumed that people using older
>> kernel don't do a lot of development anymore :-)
>>
>> We can just unconditionally run this in a POST_RSYNC_HOOK - it will
>> only get executed when LINUX_OVERRIDE_SRCDIR is used.
>>
>> Note that in kernels before v3.14, the Buildroot git commit would be
>> used, which is even more confusing.
>>
>> Note that if we ever support out-of-tree builds for the kernel, this
>> patch will no longer be needed.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> I am not super enthusiastic about this change, for the simple reason
> that it solves the problem only for the linux package.
> 
> I believe what is really needed instead is to support out of tree build
> for packages that use OVERRIDE_SRCDIR/SITE_METHOD=local. That will
> solve this problem for all packages, and bring many other benefits.

 I couldn't agree more. I remember that someone once posted patches on the list
to this effect, but they never went anywhere and the original poster seems to
have lost his latest version :-P

 I needed a solution *now*, so I posted it. If anyone else needs it, they can
pick up the patch.

 I've marked the patch as Rejected in patchwork.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

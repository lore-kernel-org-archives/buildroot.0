From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Sun, 12 Oct 2014 18:37:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: add --delete to
	rsync
In-Reply-To: <20141012182600.5382ad4a@free-electrons.com>
References: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
 <20141012182600.5382ad4a@free-electrons.com>
Message-ID: <CAM+bi4sERYCa0rsUgskkEOtO_EKLHGsJvkYC+d54hgH-xbue9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas

Although it's true that something like gcc *.c isn't very elegant, I
can't agree on being the build system broken. After all, if you start
adding and removing files from the source code, the expectation should
be that the next build is going to be different from the previous one.
Nevertheless, if this hasn't come to attention before it's probably a
non problem (I saw this happen on a custom package that isn't even a
real package, just fiddling around and making tests), so I understand
the reject.

The only solution I can think of that satisfies both conditions (fast
builds and identical tree) is something like saving (where?) the
output of `find $(X_OVERRIDE_SRCDIR)` before rsyncing for the first
time, and after rsyncing for the second time remove files listed on
the saved list from before previous to doing the next rsync.

Do you have any opinion on this idea? Admittedly, it seems ugly.

Regards

2014-10-12 18:26 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Alvaro G. M,
>
> On Fri, 10 Oct 2014 11:14:47 +0200, Alvaro G. M wrote:
>> When a source overriden package is built and then its source code is modified
>> and rebuilt with make package-rebuild, it is needed for the build directory
>> to contain exactly the same source that is in the original directory,
>> so rsync must not only copy missing files, but also remove those that existed
>> previously but now don't.
>>
>> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
>> ---
>>  package/pkg-generic.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> The fact that adding --delete would delete all object/generated files
> makes this patch really not usable, as it basically kills completely
> the entire purpose of OVERRIDE_SRCDIR + make <foo>-rebuild. We think
> that the small advantage brought by this patch is largely outweighed by
> the major inconvenience it causes. The build system of most packages is
> reasonable, and will not take into account random source files hanging
> around. If the build system of your package is so broken that it builds
> random files by just building *.c or *.cpp, then it's really the build
> system that should be fixed.
>
> Since there is no way to distinguish the files to remove from the files
> to keep, we prefer to keep them all, in order to keep its usefulness to
> 'make <foo>-rebuild'.
>
> As a consequence, we've marked the patch as Rejected in our patch
> tracking system.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
?lvaro G?mez Machado

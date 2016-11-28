From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Nov 2016 15:29:23 +0100
Subject: [Buildroot] makedevs: make device node creation idempotent
In-Reply-To: <4EF02AFE-964D-482A-9214-8C1280FDBBDA@abelbeck.com>
References: <4EF02AFE-964D-482A-9214-8C1280FDBBDA@abelbeck.com>
Message-ID: <8b4ddea9-a7b8-63db-9b4b-74fbaad5d7f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[I hope you don't mind I add the mailing list in Cc]

On 28-11-16 14:23, Lonnie Abelbeck wrote:
> Peter,
> 
> I see you reverted this makedevs "fix" required by the now reverted pseudo ...
> 
> makedevs: make device node creation idempotent
> https://git.buildroot.net/buildroot/commit/package?id=c85cd189dc1ded92b78c5968860ff447ec9815ad
> 
> Isn't this makedevs "fix" still a good thing to have under fakeroot ?  Isn't it better not to count on a special behavior of mknod() under fakeroot ?

 With this fix, under fakeroot, makedevs will fail when you run it a second time
because the file exists already and is NOT a device node. That's because with
fakeroot we don't save the database with the faked information. So a second run
of fakeroot will just see an empty file and doesn't know that it was supposed to
be a device node. pseudo always saves the database so it doesn't have this
problem (except that in some cases it *does* have this problem because the
daemon gets killed before the database is saved - solved by [1] ).

 So, although the fix would be good in theory, it breaks operation in practice.
It breaks when you have to rootfses, or when you rebuild without cleaning.

 Note that in a first version of this patch [2], I simply unlinked the files
before doing mknod. This will also work under fakeroot. However, Yann didn't
like that:
> NAK: we really do not want that files exist in the target in case they
> are configured as device nodes in a dev-table. This should not happen.


 Note also that upstream busybox implemented an even simpler version of this
patch [3]+[4]. If/when we return to pseudo, we should apply that version instead.

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/699575/
[2] http://patchwork.ozlabs.org/patch/691496/
[3]
https://git.busybox.net/busybox/commit/?id=2c769c69b269f43d8c9ecf4a7f5ce5cce290750a
[4]
https://git.busybox.net/busybox/diff/miscutils/makedevs.c?id=1d3a04a3a4be8682d4317251fc14e81ad655d58a


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

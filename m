From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 10 Jul 2015 13:38:11 +0200
Subject: [Buildroot] [PATCH v5 2/2] pkg-luarocks: fix top-level parallel
 makefile support
In-Reply-To: <559AFB4E.9090101@mind.be>
References: <1435738247-9015-1-git-send-email-fabio.porcedda@gmail.com>
 <1435738247-9015-3-git-send-email-fabio.porcedda@gmail.com>
 <20150704152639.1c1cc720@free-electrons.com> <559AFB4E.9090101@mind.be>
Message-ID: <CAHkwnC88hALupXEuZoJuEZurQaSmjFgA_jNL4no8oec5Cjn0Lg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 7, 2015 at 12:03 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/04/15 15:26, Thomas Petazzoni wrote:
>> However, won't we see some similar issues with other packages? Should
>> we preventively do a flock on HOST_DIR/STAGING_DIR/TARGET_DIR when
>> installing to host/staging/target respectively, so that we are sure
>> that at any given time, we don't have two packages installing at the
>> same time in one of the directories? Theoretically, this shouldn't be
>> needed if all packages install their own files, or if they have the
>> proper dependencies when they are overwriting files from another
>> package.
>
>  There aren't many packages that would have this problem, but indeed a few. E.g.
> packages installing kernel modules will typically call depmod. So yes, it would
> be a good idea to do that in general.

Doing it in general is the simplest and safest solution, but to be the
most efficient possible i was thinking to use the same solution of
$(MAKE) and  $(MAKE1) so we need to sync just a small part of
packages.

Maybe we can try to test how much performance is lost if a global lock
for all packages is used.

>  However, how are you going to do that in practice? flock works like fakeroot,
> you have to run the commands from within the process. But all our INSTALL_*_CMDS
> are supposed to be called as separate shell scripts.
>
>  So we'd have to use something like dotlockfile, but I don't think we can assume
> that's installed everywhere, can we? Or else we have to devise something similar
> around flock.

I didn't know dotlockfile, it seems installed by default on Fedora 22
and Ubuntu 14.04.
Maybe the only downside of dotlockfile is that the sleep interval of 5
seconds is not configurable.
Anyway it seems a good solution for locking host/staging/target directories.

After merging the per-package staging feature we need to lock only
host and target.
Finally after developing the per-package host we need to sync just the
target directory.

Best regards
-- 
Fabio Porcedda

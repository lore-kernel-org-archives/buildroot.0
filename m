From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Sep 2018 09:20:10 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
In-Reply-To: <20180902204505.30928-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 2 Sep 2018 22:45:05 +0200")
References: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
Message-ID: <871sab3v4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The Github repository at https://github.com/symless/synergy no longer
 > exists, it has apparently been moved to
 > https://github.com/symless/synergy-core.

 > On master as of 811734ef9044bbdfc067da76358153061fae2031, we use
 > v1.8.8, which fails to download from github.com, so we fallback to
 > sources.buildroot.net, which has the tarball.

 > However, on next as of 7da2748c9ef4e67a060ea7eb6ff23275da235daa, we
 > use v2.1.0, which completely fails to download, as we don't have a
 > backup tarball on sources.buildroot.net.

 > This commit fixes that by using the new upstream
 > location. Unfortunately, the hash changes, because the prefix in the
 > tarball is changed from synergy-1.8.8-stable/ to
 > synergy-core-1.8.8-stable/. There are no other changes. This means
 > that people having existing tarballs locally we'll see them being
 > re-downloaded because the hash has changed.

 > Fixes (once applied to next):

 >   http://autobuild.buildroot.net/results/82ae9a378b70a3d27e78e1d80a63495b37329e16/

 >  SYNERGY_VERSION = v1.8.8-stable
 > -SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
 > +SYNERGY_SITE = $(call github,symless,synergy-core,$(SYNERGY_VERSION))

So is the idea to apply this to next or to master? If we change the hash
for the 1.8.8 version, then this will break download for the 2018.02.x /
2018.05.x releases.

Looking at the synergy git history, a hack could be to bump the version
to the commit just after v1.8.8 together with changing the URL so we end
up with a new tarball name:

commit ec56ac4485ef8e3cf986107b8456949b5aec3527
Author: Andrew Nelless <andrew@symless.com>
Date:   Fri Mar 3 14:51:23 2017 +0000

    Fix version number in Changelog

-- 
Bye, Peter Korsgaard

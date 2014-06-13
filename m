From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Fri, 13 Jun 2014 10:54:20 +0200
Subject: [Buildroot] rsync forces configure step
Message-ID: <1f09233e5be11d75394054a20c4631cd@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have recently upgraded from Buildroot 2014.02 to 2014.05, and I have 
noticed that some developments related to top-level parallel build have 
resulted in a small change of behaviour, which I would consider as a 
regression.

When a package is used in rsync mode, make <pkg>-rebuild also forces the 
configure step.

This has been introduced by this commit:
http://git.buildroot.net/buildroot/commit/package/pkg-generic.mk?id=6c5c08b854e4490697076ae3c5a9c587d8672c63
... and this line in particular:
$$($(2)_TARGET_CONFIGURE): $$($(2)_TARGET_RSYNC)

I believe the right way to support parallel build without forcing the 
configure step in case of rsync, is to use an order-only prerequisite 
(with a pipe):
$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)

I have checked this correction successfully.

I suppose that there are other dependencies that should be updated with 
a pipe, but I can't say which ones for sure...

Thank you.

-- 
C?dric

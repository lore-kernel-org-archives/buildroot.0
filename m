From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 09:36:09 +0200
Subject: [Buildroot] [PATCH 3/3] Makefile.package.in: Fixing git
 download method
In-Reply-To: <BANLkTinQcHkTmHoq9ci_QYgaj8vAqZ07yQ@mail.gmail.com>
References: <1305008226-8906-1-git-send-email-a@awn.dk>
	<1305008226-8906-4-git-send-email-a@awn.dk>
	<20110510085335.5c9be308@surf>
	<BANLkTinQcHkTmHoq9ci_QYgaj8vAqZ07yQ@mail.gmail.com>
Message-ID: <20110510093609.203d64f9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 May 2011 09:22:22 +0200
Allan Nielsen <a@awn.dk> wrote:

> When I run buildroot $(DL_DIR) is a relative path which says ./src and
> the current directory (at this point) is $(DL_DIR)/my-git-package/,
> and it will try to place the tar file in
> $(DL_DIR)/my-git-package/src/my-git-package.tar.gz which is the wrong
> place.
> 
> The suggested change should work both when $(DL_DIR) is relative and absolute.

Ah, yes, got it.

> Alternative I could of cause just change my $(DL_DIR) variable to an
> absolute path.

Or, better, make sure that DL_DIR is an absolute path even if it was
defined as a relative path in the configuration. Something like
(untested):

  DL_DIR=$(call qstrip,$(BR2_DL_DIR))
  ifeq ($(DL_DIR),)
  DL_DIR:=$(TOPDIR)/dl
  endif
+ DL_DIR=$(shell readlink -f $(DL_DIR))

in package/Makefile.package.in

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

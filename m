From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:24:43 +0200
Subject: [Buildroot] [PATCH v5 06/14] package/skeleton: split out into
 skeleton-common
In-Reply-To: <20170801225224.16899-7-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
 <20170801225224.16899-7-arnout@mind.be>
Message-ID: <20170802192443.5a47e27c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 00:52:16 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> We don't name it skeleton-default, because it will be further split
> later, into a skeleton for sysv and another for systemd, with some parts
> still common between the two. So just name it skeleton-common right now;
> this will save us a rename later.
> 
> We keep in the skeleton package all definitions of macros and variables
> that can be used by other skeleton packages and/or init systems, and
> just offload the actual feeding of the skeleton to the new package.

This paragraph was actually no longer true: after this patch,
package/skeleton/skeleton.mk is basically empty, with just a dependency
on skeleton-custom or skeleton-common:

==
SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
SKELETON_ADD_SKELETON_DEPENDENCY = NO

ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM),y)
SKELETON_DEPENDENCIES = skeleton-custom
else
SKELETON_DEPENDENCIES = skeleton-common
endif

$(eval $(generic-package))
==

So I've dropped this paragraph from the commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 02:16:12 +0200
Subject: [Buildroot] [PATCH 04/14 v4] package/skeleton: split out into
 skeleton-custom
In-Reply-To: <af2a3c603d857f4012889fb60931a514bdbd93a8.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
 <af2a3c603d857f4012889fb60931a514bdbd93a8.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <65699c6d-b520-b932-45dc-bf9e98bede7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 25-07-17 23:14, Yann E. MORIN wrote:
> For the custom skeleton, we practicaly do nothing, except ensure it
                              do practically

> contains the basic, required directories, and that those are properly
> setup wrt. merged /usr.
[snip]

 I don't like this: you are doing *a whole lot* more than just moving stuff from
skeleton to skeleton-custom (and renaming the variables):

> +SKELETON_CUSTOM_LIB_INODE = $(shell stat -c '%i' $(SKELETON_CUSTOM_PATH)/lib/. 2>/dev/null)
> -SKELETON_LIB_INODE = $(shell stat -c '%i' $(SKELETON_PATH)/lib/.)

> +# Ensure that the custom skeleton has /lib, /bin and /sbin, and their
> +# /usr counterparts
> +ifeq ($(SKELETON_CUSTOM_LIB_INODE),)
> +SKELETON_CUSTOM_MISSING_DIRS += /lib
> +endif

> +# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
> +# counterparts are appropriately setup as symlinks ones to the others.

> +ifneq ($(SKELETON_CUSTOM_LIB_INODE),$(SKELETON_CUSTOM_USR_LIB_INODE))
> +SKELETON_CUSTOM_NOT_MERGED_USR_DIRS += /lib
> +endif
> -ifneq ($(SKELETON_LIB_INODE),$(SKELETON_USR_LIB_INODE))
> -SKELETON_CUSTOM_NOT_MERGED_USR += /lib
> -endif

> +ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
> +ifneq ($(SKELETON_CUSTOM_MISSING_DIRS),)
> +$(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is \
> +	missing those directories or symlinks: \
> +	$(SKELETON_CUSTOM_MISSING_DIRS))
> +endif

 Now, I understand that it's tricky to rebase things correctly, and splitting
this up is anyway mainly relevant for review, so I've just updated the commit
message to reflect all these changes.

> +$(error The custom skeleton in $(SKELETON_PATH) is not \
> +       using a merged /usr for the following directories: \
> +       $(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))

 Spaces should be tab.

> +# Provided by the 'skeleton' package:
> +# - SKELETON_RSYNC
> +# - SKELETON_LIB_SYMLINK

 As mentioned in an earlier review, this is in system now and it's quite clear
that SYSTEM_RSYNC comes from system.mk, so I've removed this.


 I've fixed all that and was going to apply, but then I noticed that patch 1
breaks our tests, so I refrained from pushing it. You can fetch it from
https://gitlab.com/arnout/buildroot (master branch; will be rebased away in a
couple of days).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

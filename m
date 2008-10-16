From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 17:09:13 -0600
Subject: [Buildroot] [PATCH 9/9] Add support for cloning Linux git trees
In-Reply-To: <20081016211449.GE11249@mx.loc>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203301.15826.50075.stgit@localhost.localdomain>
	<20081016211449.GE11249@mx.loc>
Message-ID: <fa686aa40810161609k3dd259abo7f10b4ed0d871163@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 16, 2008 at 3:14 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Thu, Oct 16, 2008 at 02:33:01PM -0600, Grant Likely wrote:
>>From: Grant Likely <grant.likely@secretlab.ca>
>>
>>Add an option in Linux advanced configuration to clone a git repository
>>directly (without a snapshot tarball).
>>
>>---
>>
>>This patch depends on the earlier patch to add the variable
>>$(LINUX26_VERSION_MOD) because the value of $(LINUX26_VERSION) is set
>>to 'git' here, but the kernel could report just about any version string.

Hi Bernhard, thanks for the comments.  Replies below.

>>+if BR2_LINUX26_GIT
>>+config BR2_LINUX26_GIT_URL
>>+      string "git URL"
>>+      default "file:///path/to/git/tree/linux-2.6/"
>>+      help
>>+        URL to git repository
>>+
>>+        Any git URL works here, but you may find it more efficient to
>>+        clone from a tree on the same local filesystem using the file:///
>>+        protocol.  The file:/// protocol allows git to hardlink to the
>>+        respository database which is faster and is requires less disk
>>+        space.
>>+
>>+config BR2_LINUX26_GIT_BRANCH
>>+      string "git branch"
>>+      default "master"
>>+      help
>>+        Name of branch to use in get repository
>>+endif
>>+
>> # -----------------------------------------------
>>
>> menu "Patches"
>>@@ -418,6 +447,7 @@ config BR2_LINUX26_VERSION
>>       default "2.6.22.10" if BR2_LINUX_2_6_22_10
>>       default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE
>
> looking at the URI of this file. No wonder.

Umm, I don't know what you are referring to here.  Are you referring
to using 'git' as the value of BR2_LINUX26_VERSION instead of the full
URL?

>>       default $(BR2_CUSTOM_LINUX26_VERSION) if BR2_LINUX26_CUSTOM
>>+      default "git" if BR2_LINUX26_GIT
>>
>> menu "Linux Kernel Configuration"
>>


>>@@ -218,6 +219,14 @@ ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
>>       mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
>> endif
>>       touch $@
>>+else
>>+$(LINUX26_DIR)/.unpacked:
>>+      @echo "*** Cloning kernel git tree"
>>+      git clone --depth 1 $(BR2_LINUX26_GIT_URL) $(LINUX26_DIR)
>>+      cd $(LINUX26_DIR) && \
>>+              git reset --hard origin/$(BR2_LINUX26_GIT_BRANCH)
>>+      touch $@
>>+endif # BR2_LINUX26_GIT
>
> I've done something like this for libtool, and i *think* that i will not
> waste _that_ much bandwith over and over again. Not my call, though.

It should be okay.  Using the --depth flag keeps the download size to
the bear minimum.  Using it on current mainline results in ~100MB of
git repo (as opposed to ~50MB for a bz2 tarball and ~300MB for a full
git clone).  Also, in the help text I recommend to use a local git
tree to keep clone bandwidth costs to a minimum.

>>@@ -499,6 +508,9 @@ linux-status:
>
> linux-status. If you have make, you most likely have grep, too.
>
>>       @echo BR2_LINUX26_CUSTOM=$(BR2_LINUX26_CUSTOM)
>>       @echo BR2_CUSTOM_LINUX26_PATCH_SITE=$(BR2_CUSTOM_LINUX26_PATCH_SITE)
>>       @echo BR2_CUSTOM_LINUX26_PATCH=$(BR2_CUSTOM_LINUX26_PATCH)
>>+      @echo BR2_LINUX26_GIT=$(BR2_LINUX26_GIT)
>>+      @echo BR2_LINUX26_GIT_URL=$(BR2_LINUX26_GIT_URL)
>>+      @echo BR2_LINUX26_GIT_BRANCH=$(BR2_LINUX26_GIT_BRANCH)
>>       @echo BR2_LINUX_BSP_PATCH=$(BR2_LINUX_BSP_PATCH)
>>       @echo BR2_PACKAGE_LINUX_USE_KCONFIG=$(BR2_PACKAGE_LINUX_USE_KCONFIG)
>>       @echo BR2_PACKAGE_LINUX_USE_DEFCONFIG=$(BR2_PACKAGE_LINUX_USE_DEFCONFIG)
>>

I had mostly just been following the existing lead.  I can drop this
change if it is preferred.

Cheers,
g.


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

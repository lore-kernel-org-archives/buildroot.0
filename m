From: Andi Shyti <andi@etezian.org>
Date: Thu, 7 Nov 2013 00:40:13 +0100
Subject: [Buildroot] [PATCH] scripts: apply-patches: don't stop if no
 patch is found for a package
In-Reply-To: <527AB58A.9050506@mind.be>
References: <1383656430-29160-1-git-send-email-andi@etezian.org>
 <52793E3A.5060802@mind.be> <20131105201752.GC17791@jack.whiskey>
 <527AB58A.9050506@mind.be>
Message-ID: <20131106234013.GA9149@jack.whiskey>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >this happens when for example you want to get as cross compiler
> >the daily snapshot instead of a specific version.
> >
> >The build stops with an error because of that 'exit 1' since it
> >doesn't find any gcc-20131105 patch directory (i think the
> >snapshot is called so).
> 
>  That's a bug in the gcc package then :-)
> 
>  It should actually be converted to using the default patch strategy
> instead of post-patch hooks. Let me look into it...

Thanks for looking into it, please add me in CC when you come to
a solution.

Anyway one solution could be to check whether the gcc chosen is a
snapshot or not, something similar:

diff --git a/support/scripts/apply-patches.sh
b/support/scripts/apply-patches.sh
index ff72b45..12f384c 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -42,6 +42,11 @@ if [ ! -d "${builddir}" ] ; then
     exit 1
 fi
 if [ ! -d "${patchdir}" ] ; then
+    if grep -q BR2_GCC_VERSION_SNAP=y .config; then
+       echo "Warning: no patch can be applied to the daily snapshot."
+        exit
+    fi
+
     echo "Aborting.  '${patchdir}' is not a directory."
     exit 1
 fi

looks like a hack, but it's the fastest thing that comes to my
mind :)

Andi

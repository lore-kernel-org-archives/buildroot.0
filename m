From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Sep 2010 14:50:15 +0200
Subject: [Buildroot] [PATCH 4/8] Implement basic non-wget download
 methods
In-Reply-To: <201009020737.45906.minimod@morethan.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
	<1283422191-30926-5-git-send-email-maxime.petazzoni@bulix.org>
	<201009020737.45906.minimod@morethan.org>
Message-ID: <20100902145015.7e646a8b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2 Sep 2010 07:37:43 -0500
"Michael S. Zick" <minimod@morethan.org> wrote:

> For the cases where the protocol scheme does not appear in the URI
> that the user would input (such as private repository access via ssl)
> -
> 
> Will that _SITE_METHOD variable be able to override the autodetection?

Yes :

+ifndef $(2)_SITE_METHOD
+ ifdef $(3)_SITE_METHOD
+  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
+ else
+	# Try automatic detection using the scheme part of the URI
+	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call
qstrip,$($(2)_SITE))))
+ endif
+endif

So, if FOOBAR_SITE_METHOD is already defined, nothing happens. What
this thing does is :

 1. Define HOST_FOOBAR_SITE_METHOD to FOOBAR_SITE_METHOD if
    FOOBAR_SITE_METHOD is defined but not HOST_FOOBAR_SITE_METHOD

 2. Define (HOST_)FOOBAR_SITE_METHOD to an autodected scheme is
    (HOST_)FOOBAR_SITE_METHOD is not defined.

So whenever FOOBAR_SITE_METHOD is defined, it will take precedence over
the autodetection.

> Both git and hg (Mercurial) can use ssl/ssh to identify users with
> access to a repository. I do not know about svn, never studied or
> used it that much. In the case of git, the following is the _only_
> way to identify private users: (Since git does not accept a ssh://
> scheme in its command parse.)

I must be missing something: I'm using
ssh://uclibc.org/home/tpetazzoni/git/buildroot.git as a Git URL to push
things to my private Buildroot repository hosted at uclibc.org.

As far as I see, Gitolite introduces per-branch or per-tag permissions,
but plain Git already allows per-repository permissions. No ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

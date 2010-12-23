From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:43:01 +0100
Subject: [Buildroot] On the semantic of BR2_HAVE_DEVFILES
In-Reply-To: <87wrn1tsjw.fsf@macbook.be.48ers.dk>
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<3f29fe94726ed9c3c04e46626f138dd026b7b9b7.1293038710.git.thomas.petazzoni@free-electrons.com>
	<87wrn1tsjw.fsf@macbook.be.48ers.dk>
Message-ID: <20101223084301.3bb4ed6e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Dec 2010 22:18:43 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> This (and the rest of the series) should presumably only be done if
> !BR2_HAVE_DEVFILES?

Well, BR2_HAVE_DEVFILES is quite a mess, and it'd be good to clarify
what packages should do or do not regarding BR2_HAVE_DEVFILES. I
volunteer to summarize the outcome of the discussion and put that
summary into the documentation.

What I find odd is that :

 * On one side, when BR2_HAVE_DEVFILES is defined, in target-finalize,
   we don't remove .a, .la, header files, etc.

 * On the other side, when BR2_HAVE_DEVFILES is defined, in the same
   target-finalize, we also copy the .a, .la and headers files from the
   $(STAGING_DIR) to the $(TARGET_DIR).

So it really isn't clear what packages should do :

 * Should they install everything in $(TARGET_DIR), including
   development files (.a, .la and headers), and let target-finalize
   clean-up the unnecessary bits

 * Should they not install development files in $(TARGET_DIR), and rely
   on target-finalize to copy them back from $(STAGING_DIR)

Let's try to make one proposal as a starting point for the discussion:

 * All packages should install everything in $(TARGET_DIR), including
   development files

 * All packages should add to a <pkg>_EXTRA_DEVFILES variables the
   development files that are non-standard (i.e not headers or .a, .la
   files), so things like *-config scripts.

 * In target-finalize, when BR2_HAVE_DEVFILES is not selected, we
   remove all development files (as we do, but also the list of files
   in all <pkg>_EXTRA_DEVFILES). Note that with Lionel's work on
   packages, this clean-up phase will happen directly after the package
   installation, but that doesn't make much of a difference.

And we get rid of the copy thing that happens in target-finalize when
BR2_HAVE_DEVFILES is selected.

Obviously, with this scheme, switching from !BR2_HAVE_DEVFILES to
BR2_HAVE_DEVFILES involved a complete rebuild. But that does not seem
unreasonable.

Thoughts ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

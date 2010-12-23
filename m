From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Dec 2010 09:55:19 +0100
Subject: [Buildroot] On the semantic of BR2_HAVE_DEVFILES
In-Reply-To: <20101223084301.3bb4ed6e@surf> (Thomas Petazzoni's message of
	"Thu, 23 Dec 2010 08:43:01 +0100")
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<3f29fe94726ed9c3c04e46626f138dd026b7b9b7.1293038710.git.thomas.petazzoni@free-electrons.com>
	<87wrn1tsjw.fsf@macbook.be.48ers.dk> <20101223084301.3bb4ed6e@surf>
Message-ID: <87r5d8swaw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> On Wed, 22 Dec 2010 22:18:43 +0100
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> This (and the rest of the series) should presumably only be done if
 >> !BR2_HAVE_DEVFILES?

 Thomas> Well, BR2_HAVE_DEVFILES is quite a mess, and it'd be good to clarify
 Thomas> what packages should do or do not regarding BR2_HAVE_DEVFILES. I
 Thomas> volunteer to summarize the outcome of the discussion and put that
 Thomas> summary into the documentation.

I've never had a need for HAVE_DEVFILES (It was added by John Voltz in
2008 - bc67ca29d36), but I'll try.

 Thomas> What I find odd is that :

 Thomas>  * On one side, when BR2_HAVE_DEVFILES is defined, in target-finalize,
 Thomas>    we don't remove .a, .la, header files, etc.

 Thomas>  * On the other side, when BR2_HAVE_DEVFILES is defined, in the same
 Thomas>    target-finalize, we also copy the .a, .la and headers files from the
 Thomas>    $(STAGING_DIR) to the $(TARGET_DIR).

This 2nd step was afaik for old packages that didn't just do
make DESTDIR=$(TARGET_DIR) install.

 Thomas> So it really isn't clear what packages should do :

 Thomas>  * Should they install everything in $(TARGET_DIR), including
 Thomas>    development files (.a, .la and headers), and let target-finalize
 Thomas>    clean-up the unnecessary bits

That's what I would prefer. It's the simplest option.

 Thomas> Let's try to make one proposal as a starting point for the discussion:

 Thomas>  * All packages should install everything in $(TARGET_DIR), including
 Thomas>    development files

Check.

 Thomas>  * All packages should add to a <pkg>_EXTRA_DEVFILES variables the
 Thomas>    development files that are non-standard (i.e not headers or .a, .la
 Thomas>    files), so things like *-config scripts.

For generic cleanup support? I guess we could do that, if it doesn't
complicate stuff too much.

 Thomas>  * In target-finalize, when BR2_HAVE_DEVFILES is not selected, we
 Thomas>    remove all development files (as we do, but also the list of files
 Thomas>    in all <pkg>_EXTRA_DEVFILES). Note that with Lionel's work on
 Thomas>    packages, this clean-up phase will happen directly after the package
 Thomas>    installation, but that doesn't make much of a difference.

 Thomas> And we get rid of the copy thing that happens in target-finalize when
 Thomas> BR2_HAVE_DEVFILES is selected.

Yes, once all packages are converted.

 Thomas> Obviously, with this scheme, switching from !BR2_HAVE_DEVFILES to
 Thomas> BR2_HAVE_DEVFILES involved a complete rebuild. But that does not seem
 Thomas> unreasonable.

That's imho OK.

-- 
Bye, Peter Korsgaard

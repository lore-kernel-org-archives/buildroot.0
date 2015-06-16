From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Tue, 16 Jun 2015 11:30:55 -0500
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20150616163054.GA4861@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

On Tue, Jun 16, 2015 at 03:21:28PM +0200, Anthony Viallard wrote:
> The purpose of this patch is to rebuild local site packages and theirs
> local dependencies if the source has changed. Therefore, if the source
> of a package has changed, it will be rebuild if you type make or
> make <pkg>. Likewise, if a package has a library dependency which is
> local site package too and you type make <pkg>, the library will be
> rebuild if the source has been modified.
> 
> This behavior is pretty useful if you use buildroot with many of your
> own packages. Especially if you share these packages with a developer
> team through a version control system like git.

This is pretty much my Buildroot setup/work flow.


> 
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d5b29f0..929a31c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -509,6 +509,10 @@ ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>  endif
>  
> +ifeq ($$($(2)_SITE_METHOD),local)
> +$$($(2)_TARGET_RSYNC): $(1)-clean-for-rebuild
> +endif
> +
>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  # In the normal case (no package override), the sequence of steps is
>  #  source, by downloading
> -- 
> 2.1.4
> 

I'm not sure I follow.  Let's say I have a package called test that
contains two files, main.c and test.c and depends on libtest.  If I
apply the patch, modify test main.c, and execute 'make test', I get:

(master)$ make test
make -C /home/dkehn/buildroot/src-master O=/home/dkehn/buildroot/src-master/output//. test
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_rsynced
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_staging_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_target_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_images_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_host_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_built
>>> libtest 1.0.0 Syncing from source dir doug/package/libtest/src
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS doug/package/libtest/src/ /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0
>>> libtest 1.0.0 Installing to target
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_rsynced
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_staging_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_target_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_images_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_host_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_built
>>> test 1.0.0 Syncing from source dir doug/package/test/src
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS doug/package/test/src/ /home/dkehn/buildroot/src-master/output//build/test-1.0.0

Nothing was built.  I would think it desirable, at a minimum, for
test to be rebuilt.  If I then execute
    make test-rebuild
both main.c and test.c are rebuilt even though only main.c changed.
I don't think this is desirable.

On the other hand, using 'make test-rebuild' works as expected.
However, I did notice one oddity.  Let's say I modify libtest.c and
then execute 'make test-rebuild'.

(master)$ make test-rebuild
make -C /home/dkehn/buildroot/src-master O=/home/dkehn/buildroot/src-master/output//. test-rebuild
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_rsynced
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_staging_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_target_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_images_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_host_installed
rm -f /home/dkehn/buildroot/src-master/output//build/test-1.0.0/.stamp_built
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_rsynced
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_staging_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_target_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_images_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_host_installed
rm -f /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0/.stamp_built
>>> libtest 1.0.0 Syncing from source dir doug/package/libtest/src
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS doug/package/libtest/src/ /home/dkehn/buildroot/src-master/output//build/libtest-1.0.0
>>> libtest 1.0.0 Installing to target
>>> test 1.0.0 Syncing from source dir doug/package/test/src
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS doug/package/test/src/ /home/dkehn/buildroot/src-master/output//build/test-1.0.0
>>> test 1.0.0 Building
make[3]: Nothing to be done for 'all'.
>>> test 1.0.0 Installing to target

I was expecting libtest.c in libtest to be rebuilt and all of test
to be rebuilt.  A second execution of 'make test-rebuild' does
perform the expected steps.  ...interesting.

I apologize if I've mucked this whole thing up.  These were just my
observations for an interesting patch that followed a similar work
flow.

Regards,
...doug

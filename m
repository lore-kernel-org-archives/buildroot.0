From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Oct 2013 22:54:21 -0400
Subject: [Buildroot] [PATCH 0/3] ccache compilercheck and automated option
	setup
Message-ID: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire recently inquired about a mailing list thread started back in April about ccache.  So I thought I would submit my changes as an RFC.  I can imagine that these changes might not be accepted on grounds of adding too much complication, or being too specific to my use cases.  Which would be fine - I'm just sharing the fruits of some of the helpful discussions that started on the mailing list.


Patch 1, "ccache: change compilercheck to use compiler and toolchain info":

The first patch addresses a case where ccache can be fooled in certain circumstances, resulting in using objects compiled with, say, the wrong toolchain.  (This was discovered when compiling kmod from the same project (clean, build with toolchain 1, clean, build with toolchain 2).  This original thread on the mailing list was:

http://lists.busybox.net/pipermail/buildroot/2013-April/070819.html

The patch resolves this by incorporating feedback from the compiler itself, using the compiler's "-v" output.  In fact, this is mentioned at http://ccache.samba.org/manual.html in the CCACHE_COMPILERCHECK section, and I think by inference in the "Using ccache with other compiler wrappers" section.

However, as Arnout pointed out, the -v is not quite enough to capture other changes incorporated into the toolchain wrapper.  To capture these, the patch greps out the settings from the "Target Architecture" and "Toolchain" sections of .config, and incorporates the md5sum of those settings into the ccache hash.  (The md5sum is used to not add too much more to ccache's extra checking.)

The results are these:

- Original ccache compilercheck expression (not good for buildroot):

	compilercheck = getenv("CCACHE_COMPILERCHECK");

- Current compilercheck expression in buildroot:

	compilercheck = "none";

- Example of compilercheck expression with this patch:

	compilercheck = "%compiler% -v; echo 'fd787552bdf20802b759cae764d03a48  -'";

With this patch, changes in both completely external toolchains and in buildroot's toolchain setup are factored into ccache's considerations.

The downside is that if the compiler's -v output has any absolute paths in it, and if the compiler is located in the output directory, then the resulting hashes would be unique per output directory - which would effect cases where groups might be trying to share cache directories.


Patch 2, "ccache: change default cache directory path to match config setting":

The goal of this patch is to let us call the ccache executable outside of buildroot's Makefile without defining a "BUILDROOT_CACHE_DIR" environment variable, for either setup (which overlaps the recent ccache.mk mod by Tzu-Jung Lee), or for cached compiler invocation outside of buildroot.

Commit 433290761fceb476b095548eec10adf72405e050 changed the hard-coded
ccache directory location to use BUILDROOT_CACHE_DIR, which is exported
by Makefile based on the BR2_CCACHE_DIR config option.  This allowed the
cache location to be changed on-the-fly by setting an environment
variable, but left the default location of ccache's normal default at
"$HOME/.ccache".  Since this location does not match the default for
BR2_CCACHE_DIR, it is basically almost never correct, so direct invocation
of ccache outside of the buildroot Makefile becomes cumbersome.

This patch changes the last-ditch cache location from "$HOME/.ccache" to
the BR2_CCACHE_DIR value at the time of host-ccache compilation.

- Original ccache default cache directory location:

	cache_dir = getenv("CCACHE_DIR");
	if (cache_dir) {
		cache_dir = x_strdup(cache_dir);
	} else {
		const char *home_directory = get_home_directory();
		if (home_directory) {
			cache_dir = format("%s/.ccache", home_directory);
		}
	}

- Current default cache directory location in buildroot:

	cache_dir = getenv("BUILDROOT_CACHE_DIR");
	if (cache_dir) {
		cache_dir = x_strdup(cache_dir);
	} else {
		const char *home_directory = get_home_directory();
		if (home_directory) {
			cache_dir = format("%s/.ccache", home_directory);
		}
	}

- Example of default cache directory location with this patch:

	cache_dir = getenv("BUILDROOT_CACHE_DIR");
	if (cache_dir) {
		cache_dir = x_strdup(cache_dir);
	} else {
		const char *home_directory = get_home_directory();
		if (home_directory) {
			cache_dir = format("/home/bob/.buildroot-ccache", home_directory);
		}
	}

Please note that the ability to override the location by BUILDROOT_CACHE_DIR is left intact.


Patch 3, "ccache: provide capability to do initial ccache setup":

We found that once a project gets large enough in terms of packages (for example, a multimedia project with gstreamer, lots of plugins, etc.), it begins to hit or surpass ccache's default maximum cache size - so ccache ends up pushing out old content just to get through a re-compile.  So we came up with this patch to provide a way to set cache limits on a defconfig basis, so that nice settings are pushed out to everyone on the project.  (This also has the virtue of re-establishing such a setup even if you manually delete the cache directory for whatever reason.)  If no settings are specified, then the ccache settings are left untouched.


Danomi Manchego (3):
  ccache: change compilercheck to use compiler and toolchain info
  ccache: change default cache directory path to match config setting
  ccache: provide capability to do initial ccache setup

 Config.in                |   14 +++++++++++++-
 package/ccache/ccache.mk |   40 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

-- 
1.7.9.5

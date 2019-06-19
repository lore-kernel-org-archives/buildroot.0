From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Jun 2019 22:50:01 +0200
Subject: [Buildroot] [PATCH 1/4] package: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <20190612064209.23619-2-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-2-victor.huesca@bootlin.com>
Message-ID: <35a7118e-cdf1-b29e-bceb-6c02ecef187e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Victor,

 The good news is, I applied to master :-)


On 12/06/2019 08:42, Victor Huesca wrote:
> On Github, a large number of projects name their tag vXYZ (i.e v3.0,
> v0.1, etc.). In some packages we do:
> 
>  <pkg>_VERSION = v0.3
>  <pkg>_SITE = $(call github foo,bar,$(<pkg>_VERSION))
> 
> And in some other packages we do:
> 
>  <pkg>_VERSION = 0.3
>  <pkg>_SITE = $(call github foo,bar,v$(<pkg>_VERSION))
> 
> I.e in one case we consider the version to be v0.3, in the other case
> we consider 0.3 to be the version.
> 
> The problem with v0.3 is that when used in conjunction with
> release-monitoring.org, it doesn't work very well, because
> release-monitoring.org has the concept of "version prefix" and using
> that they drop the "v" prefix for the version.

 Note: I double-checked: apparently, release-monitoring really *never* has a v
in front of the version. There are a few other things though, e.g. DIRECTFB_

> 
> Therefore, a number of packages in Buildroot have a version that
> doesn't match with release-monitoring.org because Buildroot has 'v0.3'
> and release-monitoring.org has '0.3'.
> 
> Since really the version number of 0.3, is makes sense to update our
> packages to drop this 'v'.

 As discussed earlier, a disadvantage of this patch is that we get two copies in
DL_DIR and in sources.buildroot.org, one with and one without v. However, the
total size is limited, so duplication is acceptable.

 For the github packages, since they are downloaded tarballs, the hash isn't an
issue.


> 
> This commit only addresses the (common) case of github packages where
> the prefix is simply 'v'. Other cases will be handled by separate
> commits.

 As explained below, I have not applied this patch completely.

 But first, some general remarks about this patch, with an eye of improvements
in your future contributions.

 First of all, this is an excellent commit message, good work on that!

 I guess this patch was created (at least partially) with some scripting. In
such a case, it is a good idea to show the script(s) you used in the commit
message. That way, it is possible for someone else to reproduce at least the
mechanical part. Ideally, there would be three scripts: one to do the change,
one to check if everything was changed, and one to do a test if things are still
working after the change.

 For example, I used this script to test:

git show --numstat | awk '{ print $3; }' | sed -n '/^package\//s///p' | \
    cut -d / -f 1 | uniq | \
    sed -e '/^\(faketime\|mfgtools\|ninja\|tegrarcm\)/s/^/host-/' \
        -e 's/$/-legal-info/' | xargs make


 Also, a huge patch like this is difficult to review. As shown below, review
*is* still necessary, even for (mostly?) mechanical patches. Of course,
splitting it per package is not an option. What you could have done, however, is
to split it in commits with a diffstat of roughly +100-100. So in this case,
split it in packages a-i, j-q, r-z. That makes it a little bit more grokkable.

> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

[snip]
> diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
> index 7afe849cd7..673e0026b0 100644
> --- a/package/flatbuffers/flatbuffers.hash
> +++ b/package/flatbuffers/flatbuffers.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256	3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c	flatbuffers-v1.10.0.tar.gz
> +sha256	3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c	flatbuffers-1.10.0.tar.gz
>  sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
> diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> index 69054885ea..c4ea5e1b1c 100644
> --- a/package/flatbuffers/flatbuffers.mk
> +++ b/package/flatbuffers/flatbuffers.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -FLATBUFFERS_VERSION = v1.10.0
> -FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
> +FLATBUFFERS_VERSION = 1.10.0
> +FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
>  FLATBUFFERS_LICENSE = Apache-2.0
>  FLATBUFFERS_LICENSE_FILES = LICENSE.txt
>  FLATBUFFERS_INSTALL_STAGING = YES

 flatbuffers didn't apply cleanly because it's been updated, so I just left it
like it was, since you anyway need a follow-up patch for the other fixes.

[snip]
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> index 09dbf30839..b3b029a5d0 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -JSON_FOR_MODERN_CPP_VERSION = v3.6.1
> -JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
> -JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
> +JSON_FOR_MODERN_CPP_VERSION = 3.6.1
> +JSON_FOR_MODERN_CPP_SOURCE = json-v$(JSON_FOR_MODERN_CPP_VERSION).tar.gz

 I see what you did here: since there already was a _SOURCE definition, you
changed it (instead of keeping the default value). However, I don't think that's
the right thing to do. There really is no reason to not use the default _SOURCE
for this package, AFAICS.

 In any case, because this one is special, it belongs to a separate patch so we
can discuss it.

> +JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
>  JSON_FOR_MODERN_CPP_LICENSE = MIT
>  JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
>  JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES

[snip]
> diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
> index 262adc7aab..9923ae8771 100644
> --- a/package/libpagekite/libpagekite.hash
> +++ b/package/libpagekite/libpagekite.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated
> -sha256  df95bfe95c04b6908e835e13444c1c1883765926f1265e0d2223c42d3c59a4c2  libpagekite-v0.91.171102.tar.gz
> +sha256  df95bfe95c04b6908e835e13444c1c1883765926f1265e0d2223c42d3c59a4c2  libpagekite-0.91.171102.tar.gz
>  
>  # License files, locally calculated
>  sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
>  sha256  4a271d0bb6bb6e0bac880efddb46da73e6df3dcf0d9ca08a945a232f8ab882ef  doc/LICENSE-2.0.txt
> -sha256  8e0f770cabe772d67d36469f6bf413afd2dcfa6ac37acfc65f770cf3a134106d  doc/AGPLv3.txt
> +sha256  8e0f770cabe772d67d36469f6bf413afd2dcfa6ac37acfc65f770cf3a134106d  doc/AGPL3.txt

 That doesn't seem right...

 I could have fixed this but I was lazy so I just reverted libpagekite.

[snip]
> diff --git a/package/python-scapy3k/python-scapy3k.hash b/package/python-scapy3k/python-scapy3k.hash
> index 36d5dfed3c..57a636dd35 100644
> --- a/package/python-scapy3k/python-scapy3k.hash
> +++ b/package/python-scapy3k/python-scapy3k.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25  python-scapy3k-v0.18.tar.gz
> +sha256  a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25  python-scapy3k-0.18.tar.gz

 This one gave a hash mismatch. I don't know what's happening exactly and I was
lazy, so I just reverted this one as well.

 Probably the github tarball has changed for some reason. We don't notice this
because we can still download from sources.buildroot.org with the correct hash.
However, the tarball without v doesn't exist there, so now it really fails.

 Since the name *also* changes, we can easily fix the changed hash in this case:
"old" buildroot installs will still be able to download the old tarball (which
is different) from sources.buildroot.org. "new" buildroot installs will download
the new tarball from github, and eventually that one will also end up on
sources.buildroot.org.

 However, we first should check why the hash has changed, i.e. what the
differences between the two tarballs are.


> diff --git a/package/softether/softether.mk b/package/softether/softether.mk
> index 1a31abd4bd..a7a10c79c8 100644
> --- a/package/softether/softether.mk
> +++ b/package/softether/softether.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -SOFTETHER_VERSION = v4.28-9669-beta
> -SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
> +SOFTETHER_VERSION = 4.28-9669-beta
> +SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,v$(SOFTETHER_VERSION))
>  SOFTETHER_LICENSE = GPL-2.0
>  SOFTETHER_LICENSE_FILES = LICENSE
>  SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline

 This one doesn't exist anyore on github (I guess the tag has been removed), we
always download it from sources.buildroot.org. So here, I think the workaround
(except for bumping the version) is to set SOFTETHER_SOURCE to the old name, so
the download from sources.buildroot.org still works. Alternatively, we can ask
Peter to copy the tarball to the new name before this one is applied.


 In conclusion, the following packages have *not* been updated: flatbuffers,
json-for-modern-cpp, libpagekite, python-scapy3k, softether. There might also be
new packages that are not yet included in this patch, so please check that.

 It would also be nice if we had some formal way of checking that new packages
do this correctly. Actually, it would be good if pkg-stats could generate a
report in a human-readable format so it could be used as part of the review flow
to check if the mapping with release-monitoring is OK (plus all the other things
pkg-stats evaluates).


 Regards,
 Arnout

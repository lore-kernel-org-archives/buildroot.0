From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 26 Feb 2018 21:20:51 +0200
Subject: [Buildroot] [PATCH 1/1] czmq: bump to version v4.1.0
In-Reply-To: <d43c54d6-2c1b-c2fb-06ee-e396490fbb69@mind.be>
References: <20180224164305.6133-1-asafka7@gmail.com>
 <d43c54d6-2c1b-c2fb-06ee-e396490fbb69@mind.be>
Message-ID: <CALFsTFWDLH5gJuPRLtYEqV8fJSs0Rt9mMg4BpMFmKSJp-Nvjow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, thanks for the productive comments.
I fixed all, but didn't change CZMQ_AUTORECONF because it seems all the
autotools-related files were generated and expect autotools version of 1.14
and can't be compiled with 1.15.
I uploaded a new patch here. Tell me if there's something else you want to
change.


Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/czmq/czmq.hash |  6 +++++-
 package/czmq/czmq.mk   | 10 ++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 526ea594b9..c0a7176f8d 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,2 +1,6 @@
+# From https://github.com/zeromq/czmq/releases
+md5 d29baef1079f19a2c6a360eb6be984f8 czmq-4.1.0.tar.gz
+sha1 1d201a87205811367f7c92cbbd36a899edda68bf czmq-4.1.0.tar.gz
 # Locally calculated
-sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555
czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
+sha256 3befa35b4886b5298e8329b4f0aa5bb9bde0e7439bd3c5c53295cb988371fc11
czmq-4.1.0.tar.gz
+sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5
LICENCE
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 5305789d7a..3c07845d9c 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
-CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
+CZMQ_VERSION = 4.1.0
+CZMQ_SITE =
https://github.com/zeromq/czmq/releases/download/v$(CZMQ_VERSION)

 # Autoreconf required as we use the git tree
 CZMQ_AUTORECONF = YES
@@ -18,10 +18,4 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no

-define CZMQ_CREATE_CONFIG_DIR
- mkdir -p $(@D)/config
-endef
-
-CZMQ_POST_PATCH_HOOKS += CZMQ_CREATE_CONFIG_DIR
-
 $(eval $(autotools-package))
-- 
2.14.1



On Sat, Feb 24, 2018 at 7:47 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>  Hi Asaf,
>
>  Thank you for your contribution.
>
> On 24-02-18 17:43, Asaf Kahlon wrote:
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/czmq/czmq.hash | 2 +-
> >  package/czmq/czmq.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
> > index 526ea594b9..77fdda0863 100644
> > --- a/package/czmq/czmq.hash
> > +++ b/package/czmq/czmq.hash
> > @@ -1,2 +1,2 @@
> >  # Locally calculated
> > -sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555
> czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
> > +sha256 2e87c19988d1168b70d7ec0fdce79aba4e92a6330959c3a2576c72b319acb478
> czmq-v4.1.0.tar.gz
> > diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
> > index 5305789d7a..c9a6b3c66a 100644
> > --- a/package/czmq/czmq.mk
> > +++ b/package/czmq/czmq.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ############################################################
> ####################
> >
> > -CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
> > +CZMQ_VERSION = v4.1.0
> >  CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
>
>  There is an uploaded tarball for this release [1]. Please use that one
> instead.
> It contains the configure script and the config directory, so no need
> anymore
> for CZMQ_AUTORECONF and CZMQ_CREATE_CONFIG_DIR.
>
>  Also, there are upstream md5 and sha1 sums, so please add those (with a
> reference to the URL containing them). Since we don't consider md5 and sha1
> strong enough, you'll have to keep the locally calculated sha256 as well.
>
>  Finally, please also add a hash for the license file while you're doing an
> update. This will make it easier to detect changes in the license in the
> future.
>
>  Regards,
>  Arnout
>
> >  # Autoreconf required as we use the git tree
> >
>
> [1] https://github.com/zeromq/czmq/releases/download/v4.1.0/
> czmq-4.1.0.tar.gz
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180226/ee749772/attachment.html>

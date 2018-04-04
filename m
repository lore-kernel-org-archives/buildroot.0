From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Apr 2018 08:40:47 +0200
Subject: [Buildroot] [PATCH] pkg-download.mk: do not add a trailing
 slash to <PKG>_SITE
In-Reply-To: <20180404063051.12111-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Apr 2018 08:30:51 +0200")
References: <20180404063051.12111-1-peter@korsgaard.com>
Message-ID: <878ta3o4nk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/734/7342b25f01d60cafc4a5422a5a1c282629f361c5/

 > $(dir does not strip last path separator and the wget wrapper adds a '/'
 > between the -u argument and the filename when it reconstructs the URL,
 > leading us to have two slashes before the filename when accessing the
 > upstream location.

 > Most upstream servers ignores this, but not all - Leading to download issues
 > from pypi.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/pkg-download.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
 > index 7ed95f2b2c..2c4ad3ba2c 100644
 > --- a/package/pkg-download.mk
 > +++ b/package/pkg-download.mk
 > @@ -82,7 +82,7 @@ endif
 
 >  ifeq ($(BR2_PRIMARY_SITE_ONLY),)
 >  DOWNLOAD_URIS += \
 > -	-u $($(PKG)_SITE_METHOD)+$(dir $(call qstrip,$(1)))
 > +	-u $($(PKG)_SITE_METHOD)+$(patsubst %/,%,$(dir $(call qstrip,$(1))))

Alternatively I *THINK* we can just use $($(PKG)_SITE) here.

-- 
Bye, Peter Korsgaard

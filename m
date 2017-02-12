From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:37:06 +0100
Subject: [Buildroot] [PATCH v5] gtest/gmock: bump to version 1.8.0
In-Reply-To: <9682b992-a360-024d-5876-ab3953da3a01@gmail.com>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <c410065bcf02dbf9548965118905fb4e0edfcc40.1486901824.git.casantos@datacom.ind.br>
 <9682b992-a360-024d-5876-ab3953da3a01@gmail.com>
Message-ID: <20170212153706.4768b3a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(It would be nice to strip the irrelevant part of an e-mail when
replying, so that one doesn't have to scroll through a huge e-mail just
to find one comment lost in the middle of the reply. Thanks!)

On Sun, 12 Feb 2017 15:15:17 +0100, Romain Naour wrote:

> > +# By default, build gmock and gtest
> > +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),)
> > +GTEST_CONF_OPTS = -DBUILD_GTEST=ON -DBUILD_GMOCK=OFF
> > +endif  
> 
> Here, if BR2_PACKAGE_GTEST_GMOCK is not set -DBUILD_SHARED_LIBS=OFF will be
> dropped from GTEST_CONF_OPTS.
> 
> You should use += here:
> GTEST_CONF_OPTS += -DBUILD_GTEST=ON -DBUILD_GMOCK=OFF
> 
> Otherwise shared libraries will be build:
> 
> ./googletest/libgtest_main.so
> ./googletest/libgtest.so
> 
> Maybe it's something that can be fixed while merging this patch?

Also, why is -BUILD_GTEST=on only passed when GMock is disabled?

I would have assumed something more like this:

GTEST_CONF_OPTS += -DBUILD_GTEST=ON

ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
else
GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

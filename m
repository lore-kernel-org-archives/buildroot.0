From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 14:18:43 +0200
Subject: [Buildroot] [PATCH v2] qt5location: fix build failure due to
 missing qt5base gui dependency
In-Reply-To: <3dc3c769-4128-d00e-7833-31d73bf5d514@micronovasrl.com>
References: <20180905090307.89484-1-giulio.benetti@micronovasrl.com>
 <20180905135307.051cd136@windsurf>
 <3dc3c769-4128-d00e-7833-31d73bf5d514@micronovasrl.com>
Message-ID: <20180905141843.566f9769@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Sep 2018 14:06:40 +0200, Giulio Benetti wrote:

> The problem is that its configure.json depends on it
> https://github.com/qt/qtlocation/blob/5.11/src/location/configure.json#L3

OK, so it needs GUI support.

> to check feature.opengl
> https://github.com/qt/qtlocation/blob/5.11/src/location/configure.json#L44

but OpenGL support is optional.

> Also Qt Location is for creating mapping solutions:
> http://doc.qt.io/qt-5/qtlocation-index.html
> check i.e. examples:
> http://doc.qt.io/qt-5/qtlocation-examples.html
> 
> So in the end, it seems it makes sense.
> In the beginning I thought it was a submodule to only get location 
> parameters only.

Yes, indeed.

> > Also, having BR2_PACKAGE_QT5BASE_GUI does not guarantee that OpenGL
> > support is available, so I'm not sure this is going to fix the error in
> > all cases.  
> 
> I'm executing test-pkg -a right now, I'm on 3/47 passed, need some hour.

Doing a test-pkg -a with the same configuration won't give any useful
result here. Remember that test-pkg is only testing different
*toolchain* configurations. It is not testing random configurations
with/without OpenGL.

For a change like this, a test-pkg -a is totally useless, however, a
test with just:

BR2_PACKAGE_QT5BASE=y
BR2_PACKAGE_QT5LOCATION=y

which should fail, and then a test with just:

BR2_PACKAGE_QT5BASE=y
BR2_PACKAGE_QT5BASE_GUI=y
BR2_PACKAGE_QT5LOCATION=y

should work, with no other options selected (so no OpenGL support).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

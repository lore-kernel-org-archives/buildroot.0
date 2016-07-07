From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Thu, 7 Jul 2016 23:31:14 +0900
Subject: [Buildroot] qt5: QT5_QMAKE spec bug
In-Reply-To: <20160707160636.505b2da4@free-electrons.com>
References: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
 <83bdbc0d-5521-02c6-cffa-c35a6297c0d6@stu.hosei.ac.jp>
 <ADAE54FA6BC6A040A89AC44D7C863F8379FC549B@MAIL-SINTERS-01.sinters-int.fr>
 <c7b1de47-7662-cd58-def1-f82fd70aa533@stu.hosei.ac.jp>
 <20160707160636.505b2da4@free-electrons.com>
Message-ID: <815daf75-807a-f510-bd73-d87e50b72073@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 2016-07-07 23:06, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 7 Jul 2016 22:55:36 +0900, Akihiko Odaki wrote:
>
>> I think those packages are not meant to be built for the host.
>
> QT5_QMAKE is a variable meant to built qmake-based packages for the
> target. It has never been intended to build qmake-based packages for
> the host.
>
> Which qmake-based package do you need to build for host? Notice that we
> do not build qt5 for the host, so in order to build qmake-based
> packages for the host, you would first have to create a host-qt5base
> package, which is going to cause a lot of problems down the road.

qtwaylandscanner in qt5wayland, a package I made. Actually it can be 
built without host-qt5base.

http://code.qt.io/cgit/qt/qtwayland.git/tree/src/qtwaylandscanner

>>  > Python and others already have their own infrastructures so they
>> don't need this kind of stuff.
>>
>> You mean package/pkg-*.mk by the infrastructures? Many packages
>> depending on Python don't use package/pkg-python.mk and specify the path
>> in their -.mk.
>>
>> $ git grep bin/python | wc -l
>> 93
>
> Using Python and being a Python package are completely different things.
>
> The Python package infrastructure is used by Python modules that use
> distutils or setuptools.
>
> But besides that, lots of packages use Python in their build process,
> even if they are not at all Python modules.

Anyway, such building tools have no variables for their pathes?

>> The variable is not used in Qt packages and they will need to be
>> modified to use the variable if it is kept. My patches to add a few Qt
>> packages are also pending. There is no option to keep as they are.
>
> Not sure I understood this part.

So actually packages in package/qt5 doesn't use QT5_QMAKE variable.

$ git grep bin/qmake package/qt5 | wc -l
23

Shouldn't they refer to QT5_QMAKE if it is kept?

In contrast, QT5_QMAKE is referred in 4 packages.

$ git grep QT5_QMAKE package | wc -l
5

Regards,
Akihiko Odaki

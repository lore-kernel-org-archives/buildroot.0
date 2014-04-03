From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 3 Apr 2014 18:25:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-02
In-Reply-To: <20140403063009.526E4101924@stock.ovh.net>
References: <20140403063009.526E4101924@stock.ovh.net>
Message-ID: <533D9978.3000404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-04-02

>         network-manager-0.9.8.8 | 1
>    mips64el |        network-manager-0.9.8.8 | NOK | http://autobuild.buildroot.net/results/3b6a40c1683d0859a934e4d79e2048e97b193e94/

This failure is caused because when network-manager is going to be built 
it detects that Qt has been installed, so it passes the option 
--enable-qt, which enables the Qt examples. It doesn't build 
network-manager with Qt support (don't get confused by the name), it 
only causes the Qt example to be built.
The Qt example included in network-manager uses an operator which is 
available only if Qt has been built with STL compatibility. This is the 
description of the operator:

"This operator is only available if Qt is configured with STL 
compatibility enabled."

From: http://qt-project.org/doc/qt-4.8/qstring.html#toStdString

So, to be able to build that network-manager Qt example and fix the 
autobuild failure we need to select BR2_PACKAGE_QT_STL. Or, the other 
option (and I think is the one that has more sense) is to pass 
--disable-qt to the network-manager configure options.

-- 
Vincent

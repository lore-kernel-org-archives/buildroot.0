From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 26 Jan 2015 10:34:34 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <87siey4i48.fsf@dell.be.48ers.dk>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>	<20150120174507.1d11ab61@free-electrons.com>
 <87siey4i48.fsf@dell.be.48ers.dk>
Message-ID: <54C60A2A.9090805@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/2015 23:20, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear Richard Genoud,
>  > On Tue, 20 Jan 2015 11:17:28 +0100, Richard Genoud wrote:
>  >> If Qt is compile as a static library, there's no point compiling qwt as
>  >> a shared library, otherwise, we will have a huge qwt lib and a huge Qt
>  >> application.
>  >> 
>  >> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>>>
>  >> +ifeq ($(BR2_PACKAGE_QT_SHARED),y)
>  >> +	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
>  >> +else
>  >> +	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
>  >> +endif
> 
>  > I think we should get rid of BR2_PACKAGE_QT_SHARED completely, and use
>  > BR2_STATIC_LIBS here instead.
> 
> I agree that it would be cleaner, but the reason the explicit QT_SHARED
> stuff was added was afaik a lot of systems only needed Qt in a single
> application / that application only used a subset of the Qt
> functionality, so having a static libQt while everything else was shared
> was quite a big win in size / startup time.

yes, that's exactly my case. I've got one single Qt application, and Qt
is quite huge, so making it static saves a lot of space.
I didn't trying to compile with BR2_STATIC_LIBS=y, but I guess that my
rootfs will be much bigger.


> It does complicate LGPL compliance and I don't know if the disk space
> concerns are as big these days though.
> 
Hum... I didn't think about the static vs dynamic LGPL compliance. I'll
have to check that.
And for disk space concern, I must admit that I haven't got much space (
60Mio for the rootfs, and the Qt application takes 10Mio


regards,
Richard

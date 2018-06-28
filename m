From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 28 Jun 2018 09:58:21 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <20180628032558.b4bgdv2qdpzssean@tarshish>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
 <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
 <CAPi7W82WL5MwxnQWri0dg5Ep92fHedomD3XJHLViLGUcr2JwXA@mail.gmail.com>
 <CAPi7W82zbZLPORsXG989MfnFVitVEFELC1FU1GDGk_0n19oMDA@mail.gmail.com>
 <20180628032558.b4bgdv2qdpzssean@tarshish>
Message-ID: <CAGm1_kuvRh-wam8N-wOyuoyfROc7J_K7FY4SFA55b-Omivmo+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice, Baruch,

On Thu, Jun 28, 2018 at 5:25 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Fabrice,
>
> On Wed, Jun 27, 2018 at 06:24:34PM +0200, Fabrice Fontaine wrote:
>> 2018-06-27 7:35 GMT+02:00 Fabrice Fontaine <fontaine.fabrice@gmail.com>:
>> > 2018-06-27 5:36 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
>> >> On Tue, Jun 26, 2018 at 11:43:26PM +0200, Fabrice Fontaine wrote:
>> >> > gnuradio needs host-python2 however there is no way to enforce this so
>> >> > add a dependency on !BR2_PACKAGE_PYTHON3.
>> >> > Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
>> >> > build host-python3.
>> >>
>> >> Why not just add host-python to _DEPENDENCIES?
>> >>
>> > Indeed, I will update my patch. Thanks for your help.
>>
>> After testing this option, this does not work. host-python2 is indeed built
>> but host-python3 is also built.
>> As a result, host-python-mako and host-python-six are built only for
>> host-python3 and not for host-python2. I don't know if this the expected
>> behavior,perhaps buildroot should always build the python2 and python3 host
>> packages?
>
> Not sure what the right solution here is.
>
> Yegor, do you have an idea?

This patch did it for me. I've made "make defconfig", select ARM for
A8 series, Linaro toolchain and python 2. Then I've just selected
gnuradio and its python support.

In this case no host-python3 will be built because we select general
Python 2 support for the target (as gnuradio enforces) and hence only
host-python will be built.

@Fabrice have you performed "make clean" after adding host-python to
the dependencies?

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index e79f848388..f2486a2fd2 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -14,6 +14,7 @@ GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 # host-python-cheetah, host-python-mako and host-python-six are needed for volk
 # to compile
 GNURADIO_DEPENDENCIES = \
+       host-python \
        host-python-cheetah \
        host-python-mako \
        host-python-six \

Yegor

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Jun 2020 09:27:46 +0200
Subject: [Buildroot] [PATCH v3] package/libcamera: bump version to
 96fab38
In-Reply-To: <2c5bda12-fde1-a43d-6bb9-6e3d3b94fbe3@ideasonboard.com>
References: <20200611094228.14887-1-ps.report@gmx.net>
 <e96772e7-eec4-1b04-6889-1a11a05c4225@ideasonboard.com>
 <20200614170205.GH2346@scaer>
 <2c5bda12-fde1-a43d-6bb9-6e3d3b94fbe3@ideasonboard.com>
Message-ID: <20200616072746.GI2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kieran, Peter, All,

On 2020-06-15 12:32 +0100, Kieran Bingham spake thusly:
> On 14/06/2020 18:02, Yann E. MORIN wrote:
[--SNIP--]
> > As I understand it, it would make sense that a thir-party provides a
> > binary blob for their hardware, nd use none of the pipelines for the
> > known boards, no?
> Libcamera could be built without any I believe (/me goes to test).
> Yes, libcamera will build successfully and cleanly with -Dpipelines=""
> 
> But a pipeline handler is always required for *operation*, and those can
> not be 'binary blobs'.
> 
> Only the image processing algorithm (IPA) components can be an external
> binary. There must be a corresponding (open source) pipeline-handler to
> support the algorithms.

OK, so I guess this indeed calls for always enabling a default pipeline
handler, and the UVC one makes for a good default one (see below).

> > If it makes sense that no pipeline is enabled, I'm fine with having none
> > enabled by default.
> I guess my only thought would be to expect at least UVC support - but
> hey, the target might not have USB - so it certainly is use-case specific.

But as you said a pipeline handler is mandatory, the UVC one is generic
enough that it is enabled by default.

What we usually do in such a situation, is something like:

    config BR2_PACKAGE_LIBCAMERA
        bool "libcamera"
        select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVC if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE

    config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
        bool

    config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
        bool "ipu3 pipeline"
        select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE

    config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
        bool "rkisp1 pipeline"
        select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE

    config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI
        bool "rpi pipeline"
        select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE

    config BR2_PACKAGE_LIBCAMERA_PIPELINE_UVC
        bool "UVC pipeline"

Peter, can you respin with this change, please? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

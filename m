From: Christian Stewart <christian@paral.in>
Date: Fri, 19 Feb 2021 15:50:41 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16
In-Reply-To: <87blcgut36.fsf@dell.be.48ers.dk>
References: <20210217222154.2144796-1-christian@paral.in>
 <87o8ghy83l.fsf@dell.be.48ers.dk>
 <CA+h8R2qMgxTZUnmqb1T3XeifcXzjm4b+U=vQ49GKhQHmw40s0g@mail.gmail.com>
 <87lfbkuu0t.fsf@dell.be.48ers.dk>
 <CA+h8R2p3c0Ds1r-f-o3o8RJ-vpYMP24QRxiWvDRoFh2Uk-_64g@mail.gmail.com>
 <87blcgut36.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2p1jfk-T53V7bRZ5y8jeiFLaRtfsB97xUqCaUZTdxLcvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Feb 19, 2021 at 4:42 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >> > We don't set GO386 so it doesn't apply.
>  >>
>  >> But using SSE2 presumably means that go applications built for i386 will
>  >> only run on machines with SSE2 support, so as a minimum we need to
>  >> adjust BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to ensure go is not
>  >> available on older i386 variants?
>
>  > Better to just set GO386=softfloat for older i386 variants without SSE2.
>
>  > IMO, this seems like a separate issue from the version bump.
>
> Why? Isn't that new behaviour? If so, this should be fixed as part of
> the version bump.

OK, I will submit a v2 which sets it if SSE2 is unavailable.

Defconfig:

BR2_x86_i486=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_RUNC=y

In v2 it should set

$(if $(GO_GO386),GO386=$(GO_GO386))

# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
GO_GO386 = softfloat
endif

Best,
Christian

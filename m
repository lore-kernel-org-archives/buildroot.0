From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Oct 2015 19:28:49 -0300
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: Disable rtmpdump
 support when PolarSSL is enabled
In-Reply-To: <20151016000223.65fd40c3@free-electrons.com>
References: <1444938921-10025-1-git-send-email-bernd.kuhls@t-online.de>
 <20151016000223.65fd40c3@free-electrons.com>
Message-ID: <562028A1.8070908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/15 19:02, Thomas Petazzoni wrote:

> Dear Bernd Kuhls,
>
> On Thu, 15 Oct 2015 21:55:21 +0200, Bernd Kuhls wrote:
>> Using rtmpdump with PolarSSL breaks ffmpeg configure:
>> /home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_random'
>> /home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_init'
>
> This indicates that polarssl doesn't provide all the symbols needed by
> librtmp.
>
> So the problem should not be fixed at the ffmpeg level, but at the
> librtmp level: any other package that will try to link with librtmp
> will have the same issue.

Hi Thomas, definitely...

> The fix should be done in rtmpdump.mk, by disabling the possibility of
> using polarssl as the crypto library. I guess it has to do with the API
> change of PolarSSL (Gustavo ?).

Those are part of the 1.2 API so no issues there.
However rtmpdump has severe issues with it's Makefile and the resulting 
librtmp.pc.
librtmp.pc.in says:

Requires: @CRYPTO_REQ@

The Makefile says (condensed):

CRYPTO=OPENSSL
#CRYPTO=GNUTLS
...
REQ_GNUTLS=gnutls,hogweed,nettle
REQ_OPENSSL=libssl,libcrypto
...
CRYPTO_REQ=$(REQ_$(CRYPTO))

Hence polarssl is never thrown into the pkgconfig fail, hence it will 
always fail.

So, as it is, rtmpdump is useless with polarssl even if it builds with 
it, so your fix is the right one unless rtmpdump is fixed.

Regards.

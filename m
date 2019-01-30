From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:28:56 +0100
Subject: [Buildroot] [PATCH] store debug information in
 $HOST_DIR/lib/debug
In-Reply-To: <20190123131539.24699-1-Gerhard@Heift.Name>
References: <20190123131539.24699-1-Gerhard@Heift.Name>
Message-ID: <CAAXf6LV8bLx0Fc_HviELwbwAAR6bLeGi+kdRTc_QRJvq9k5B-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 23 ene. 2019 a las 14:22, Gerhard Heift
(<gerhard@heift.name>) escribi?:
>
> Before striping the binaries in $TARGET_DIR, the debug information is saved to
> $HOST_DIR/lib/debug using the following command as described in [1]:
>
>   $ objcopy --only-keep-debug --compress-debug-sections $file
>
> This allows remote debugging as described in section 8.12.2 with striped
> binaries in the final image. Therefore the build ID is included during the build
> process, if debug information is enabled via BR2_ENABLE_DEBUG.
>
> [1] https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html
>
> Signed-off-by: Gerhard Heift <Gerhard@Heift.Name>
> ---
>  Makefile                   |  6 ++---
>  package/Makefile.in        | 12 ++++++---
>  support/scripts/copy-debug | 52 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 7 deletions(-)
>  create mode 100755 support/scripts/copy-debug
>

If I understand this correctly then the sysroot you'd specify in gdb
would be this new directory output/host/lib/debug, right?
Previously this gdb sysroot was set as output/staging, see
toolchain/helpers.mk. I believe that path should be adapted in your
patch.

It's unclear to me why you selected 'output/host/lib/debug' as path:
this is not about host stuff but target stuff. Moreover, it's also not
only about 'lib' but also binaries.

Do you have some numbers regarding size impact on the buildroot
directory as a whole for a typical build?

Best regards,
Thomas

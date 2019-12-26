From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 22:01:39 +0100
Subject: [Buildroot] [PATCH] utils/br-reproduce-build: handle
 reproducibility failures
In-Reply-To: <20190825173635.23860-1-itsatharva@gmail.com>
References: <20190825173635.23860-1-itsatharva@gmail.com>
Message-ID: <20191226220139.3d49d5ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Aug 2019 23:06:35 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Add a condition to check if the config has BR2_REPRODUCIBLE enabled and if it
> does, run the build in two output directories - output-1, output-2 - and then
> run diffoscope on the generated images.
> 
> NOTE: You should have diffoscope installed in order to test reproducibility
> failures.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Thanks, I've applied to buildroot-test after doing some changes. See
below.

> +# Handle cases of testing reproducibility failures.
> +# Run the build in different output directories if BR2_REPRODUCIBLE=y
> +# and run diffoscope on the generated images. Output of diffoscope is
> +# saved in the "output-1" directory.
> +# NOTE: You should have diffoscope installed in order to test
> +# reproducibility failures.
> +if grep -Fxq "BR2_REPRODUCIBLE=y" "${BUILD_DIR}/config"; then
> +    mkdir ../output-1 ../output-2
> +    cp "${BUILD_DIR}/config" ../output-1/.config
> +    cp "${BUILD_DIR}/config" ../output-2/.config

In the non-reproducible case, here we do an "olddefconfig" of the
configuration, so I've done the same, in both the output-1 and output-2
directories.

> +    make 2>&1 O=../output-1 | tee logfile && make 2>&1 O=../output-2 | tee logfile

Here if the build fails we don't abort, we continue with the diffoscope
call, which will fail since the rootfs.tar doesn't exist, so I've added
a check for that.

Also, the "logfile" was overwriting itself: it is created in the
buildroot/ source directory, so it is common to both builds. So I
changed their name to logfile-1 and logfile-2.

> +    PREFIX=$(make --no-print-directory O=../output-1 printvars VARS=TARGET_CROSS | cut -c 14- | head -c -1)
> +    IMAGE_1="../output-1/images/rootfs.tar"
> +    IMAGE_2="../output-2/images/rootfs.tar"
> +    diffoscope ${IMAGE_1} ${IMAGE_2} --tool-prefix-binutils ${PREFIX} --text ../output-1/diffoscope_results.txt
> +else
> +    mkdir ../output
> +    cp "${BUILD_DIR}/config" ../output/.config
> +    make olddefconfig O=../output/
> +    make 2>&1 O=../output | tee logfile
> +fi
> \ No newline at end of file

And I added a newline character at the end of the file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 15:41:37 +0200
Subject: [Buildroot] [PATCH v2 3/5] autobuild-run: make diffoscope
 output a JSON-formatted file as well
In-Reply-To: <20190810035902.14047-3-itsatharva@gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
 <20190810035902.14047-3-itsatharva@gmail.com>
Message-ID: <20190811154137.0840ee6e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

On Sat, 10 Aug 2019 09:29:00 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

>          reproducible_results = os.path.join(self.outputdir, "results", "reproducible_results")

I change the name of the JSON file to:

	diffoscope-results.json

> +        reproducible_results_text = os.path.join(self.outputdir, "results", "reproducible_results_text")

And the name of the text file to:

	diffoscope-results.txt

These names seem more sensible to me, and match better what we're
already using for other files in the build results.

I've applied to buildroot-test with this change. I have another
suggestion below, though.

>          # Using only tar images for now
>          build_1_image = os.path.join(self.outputdir, "images", "rootfs.tar")
>          build_2_image = os.path.join(self.outputdir_2, "images", "rootfs.tar")
> @@ -453,7 +454,9 @@ class Builder:
>                  prefix = prefix[13:-1]
>                  log_write(self.log, "INFO: running diffoscope on images")
>                  subprocess.call(["diffoscope", build_1_image, build_2_image,
> -                                "--tool-prefix-binutils", prefix], stdout=diff, stderr=self.log)
> +                                 "--tool-prefix-binutils", prefix, "--json", "-",

Instead of outputting the result to stdout, and then redirecting the
stdout to "diff", what about using diffoscope ability to directly
output to a file:

	"--json", reproducible_results, "--text", reproducible_results_text

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

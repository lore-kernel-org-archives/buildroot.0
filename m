From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 12:37:59 +0200
Subject: [Buildroot] [PATCH] package/harfbuzz: fix static linking for
 test-unicode program
In-Reply-To: <1431988660-3991-1-git-send-email-romain.naour@openwide.fr>
References: <1431988660-3991-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150521123759.5b3c9706@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 19 May 2015 00:37:40 +0200, Romain Naour wrote:
> During static build, -lstdc++ is required to link
> against libicuuc.a.
> 
> Fixes:
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...1-test-unicode-add-lstdc-for-static-build.patch | 29
> ++++++++++++++++++++++ 1 file changed, 29 insertions(+)
>  create mode 100644
> package/harfbuzz/0001-test-unicode-add-lstdc-for-static-build.patch

Maybe I'm missing something, but I still don't think this is the right
fix. harfbuzz is using pkg-config to detect icu-uc. So the problem is
really that the icu-uc .pc file does not declare its dependency on
lstdc++.

I've tried on my Ubuntu distro. Try to build the following stupid
program:

#include <unicode/utypes.h>
#include <unicode/ustring.h>

int main(void) {
 UChar         source            [42];
 u_uastrcpy(source, "This is a test.");
 return 0;
}

If you build it with:

$ gcc -static -o foo foo.c $(pkg-config --static --libs --cflags icu-uc)

it fails like our build failure. Now if you fix the icu-uc .pc file by
adding -lstdc++ -lpthread in base_libs (which gets used in
Libs.private), the build succeeds.

So shouldn't we fix icu-uc.pc instead of hardcoding the need for
-lstdc++ in harfbuzz?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

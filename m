From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 22:53:07 +0200
Subject: [Buildroot] [PATCH] flashrom: fix static build with uClibc
In-Reply-To: <c35f0becf1a31f14275820c0f1c3e5d1742ded47.1505895438.git.baruch@tkos.co.il>
References: <c35f0becf1a31f14275820c0f1c3e5d1742ded47.1505895438.git.baruch@tkos.co.il>
Message-ID: <a38af34c-79d3-33d5-01a2-066ce9165c6d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 10:17, Baruch Siach wrote:
> Define HAVE_STRNLEN to avoid local strnlen() definition.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7dc/7dc4298e3a07c73e03f70205516d68a0f4c2d297/
> http://autobuild.buildroot.net/results/e36/e362848eb45f6b8100131361e6e5faa546f0bbd8/
> http://autobuild.buildroot.net/results/69e/69ef10ec710f418b4d10c1edb4f2ce2e49b522bf/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> It seems like only uClibc is affected. Build with musl succeeds even
> though the resulting binary contains a global strnlen symbol.

 musl puts strnlen in a separate strnlen.o file. Since linking is done per
object file, and there is no undefined symbol that pulls in strnlen.o (since
strnlen is already defined), it will just use the flashrom version of the function.

 uClibc also puts strnlen in a separate object file. However, that object file
also contain the hidden symbol __GI_strnlen which is referred to from other
object files in the archive (e.g. vfprintf). Therefore, strnlen.o will be linked
in and you get a double definition.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

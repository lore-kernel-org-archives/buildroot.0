From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 18:31:26 +0200
Subject: [Buildroot] [PATCH v5 1/3] busybox: disable nslookup applet
In-Reply-To: <1436890174-23236-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436890174-23236-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150714183126.3a0ed496@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Tue, 14 Jul 2015 13:09:32 -0300, Guido Mart?nez wrote:
> Some toolchains have no resolver support (res_* family), so they fail to
> build this applet (which is the only user of those functions). Instead
> of selectively disabling it on such limited toolchains, just drop it
> from the default config, since (to the best of my knowledge) is not
> widely used.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

I know this solution was suggested to you instead of adding a new
toolchain option that tells us whether resolver support is available or
not.

However, the problem with the solution of changing the Busybox config
file is that it fixes Busybox only: there will possibly be plenty of
other packages using res_*(). And we will have no way to fix those
packages in a proper way, except possibly by making them 'depends
on !BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412'. But if other
OSELAS toolchains for other architectures also lack resolver support,
then we will have to add more and more of those exclusions.

Conclusion: I am wondering if your initial solution was not the right
one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

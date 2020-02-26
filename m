From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 26 Feb 2020 23:59:53 +0200
Subject: [Buildroot] external, how to achieve our needs?
In-Reply-To: <875zft8joy.fsf@dell.be.48ers.dk>
References: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
 <VI1PR02MB3920FE7EF8D9CDDC656EAB49DCEA0@VI1PR02MB3920.eurprd02.prod.outlook.com>
 <20200226132916.5umjrlej5to4shtl@M43218.corp.atmel.com>
 <875zft8joy.fsf@dell.be.48ers.dk>
Message-ID: <CAMw6YJK2tDGYqJ=nxmUYUxrP_Z4mo=gXUAg-smwxBVCCsw-FNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Wed, Feb 26, 2020 at 5:14 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@microchip.com> writes:
>
>  > Hi Mircea,
>  > On Wed, Feb 26, 2020 at 12:11:36PM +0000, Mircea GLIGA wrote:
>  >> Hi Ludovic,
>  >>
>  >> I also have this kind of problems when implementing our external,
>  >> sometimes is useful to 'override' or append to a recipe (Yocto
>  >> style).
>  >>
>  >> * I ended up "duplicating" recipes in our layer, e.g. bd-tcpdump
>  >> in order to build the package differently
>
>  > From the top of my head, I tried this and I got an error when duplicating
>  > the recipes in the external. Did you use other tricks?
>
> Buildrot uses a global namespace, so you have to rename the package (and
> the makefile/kconfig symbols) for it to work.
>
> It naturally only works for packages without any reverse dependencies as
> those packages doesn't know about your custom 'foo' package.
>

For me looks like it can be solved (did not tried yet) by:
1) Including BR2_EXTERNAL_MKS before include all the packages,

    and filter-out these which has set variable $(PKG)_OVERRIDE=y

    which means that external tree can contain some special version of
    package from the main Buildroot, and this custom .mk package can set
    XXX_OVERRIDE=YES to do not include the original package by main Makefile.

2) The custom Config.in should be not a problem as it should replace
original config
     options.

But I am not a Buildroot expert, so I might missed something.

Regards,
Vadim Kochan

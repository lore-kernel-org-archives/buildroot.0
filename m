From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon, 01 Feb 2021 17:56:36 -0800
Subject: [Buildroot] Question on udhcpc script
In-Reply-To: <5ec8ee6f2b5f99e2ce21598bb282f9fd013e68ed.camel@mendozajonas.com>
References: <CAL2JCb_UdG5-PpWbz3Yd84mSM47pGJHsjyUOn7Tzm6r_=Q4Dkg@mail.gmail.com>
 <87a6sonfgu.fsf@dell.be.48ers.dk>
 <CAL2JCb8RWKzBciDr6mGs3gUy1onKAnm3SQj04Ti3MzBG_wHG-w@mail.gmail.com>
 <875z3bopqu.fsf@dell.be.48ers.dk>
 <5ec8ee6f2b5f99e2ce21598bb282f9fd013e68ed.camel@mendozajonas.com>
Message-ID: <0cd4ec1ee046132583141d8c76a954340ad85a18.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2021-02-01 at 17:33 -0800, Samuel Mendoza-Jonas wrote:
> On Mon, 2021-02-01 at 14:56 +0100, Peter Korsgaard wrote:
> > > > > > 
> > The test indeed seems to be inverted. Samuel, any comments?
> 
> Only that I'm curious to know how this happened! I agree, that logic
> looks inverted, the line could be simplified to something like
> 
> diff --git a/package/busybox/udhcpc.script
> b/package/busybox/udhcpc.script
> index ec4d9f6185..c73ad6c2ef 100755
> --- a/package/busybox/udhcpc.script
> +++ b/package/busybox/udhcpc.script
> @@ -18,7 +18,7 @@ fi
> ?wait_for_ipv6_default_route() {
> ??????? printf "Waiting for IPv6 default route to appear"
> ??????? while [ $IF_WAIT_DELAY -gt 0 ]; do
> -?????????????? if [ -z "$(ip -6 route list | grep default)" ]; then
> +?????????????? if ip -6 route list | grep -q default; then
> ??????????????????????? printf "\n"
> ??????????????????????? return
> ??????????????? fi
> 
> I can send a quick proper patch if you'd like.
> 
> Sam

In fact, here we go:
https://patchwork.ozlabs.org/project/buildroot/patch/20210202015452.98002-1-sam at mendozajonas.com/

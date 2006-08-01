From: Rob Landley <rob@landley.net>
Date: Mon, 31 Jul 2006 20:35:14 -0400
Subject: [Buildroot] Busybox & Gcc
In-Reply-To: <44C989A9.5070103@kulak.ca>
References: <20060727184451.GA13078@reid1.localdomain>
	<44C989A9.5070103@kulak.ca>
Message-ID: <200607312035.14923.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 27 July 2006 11:51 pm, Kim Kulak wrote:
> I had a problem with that too. Here are some patches:

> -#ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"

Already did that.

> -#ident "$Id: insmod.c,v 1.126 2004/12/26 09:13:32 vapier Exp $"

And that.

>  	struct module_info info;
> -	char *module_names, *mn, *deps, *dn;
> +    union
> +       {
> +          char *buf;
> +          void *ptr;
> +       } module_names, deps;
> +	char *mn, *dn;

That's not going in.

> +    void *bufptr = (void *)bb_common_bufsiz1;

Nor is that.

> -	pkt->icmp_seq = htons(ntransmitted++);
> +	pkt->icmp_seq = htons(ntransmitted); ntransmitted += 1;

What exactly is wrong with this one?  (Argh, maybe it'll like SWAP_BE16
(ntransmitted++) better?  Yes.  Yes it does.  Sigh.  (Applied.)

> Busybox built clean after this for me with gcc 3.4.2.

And yet 4.0 isn't warning about this?

I need some time alone with select gcc developers and a whiffle bat...

So you're not seeing all the crazy "X could be used uninitialized 
because 'if(a) X=0; else X=1' just isn't good enough!" messages?

> Kim

Rob
-- 
Never bet against the cheap plastic solution.

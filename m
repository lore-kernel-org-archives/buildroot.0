From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 16:08:29 +0200
Subject: [Buildroot] [PATCHv3] core/sdk: generate the SDK tarball
 ourselves
In-Reply-To: <20180804082741.10783-1-yann.morin.1998@free.fr>
References: <20180804082741.10783-1-yann.morin.1998@free.fr>
Message-ID: <20180814160829.7d1b639a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Aug 2018 10:27:41 +0200, Yann E. MORIN wrote:
> Currently, the wording in the manual instructs the user to generate a
> tarball from "the contents of the +output/host+ directory".
> 
> This is pretty confusing, because taken literally, this would amount to
> running a command like:
> 
>     tar cf my-sdk.tar -C output/host/ .
> 
> This creates a tarbomb [0], which is very bad practice, because when
> extracted, it creates multiple files in the current directory.
> 
> What one really wants to do, is create a tarball of the host/ directory,
> with something like:
> 
>     tar cf my-sdk.tar -C output host/
> 
> However, this is not much better, because the top-most directory would
> have a very common name, host/, which is pretty easy to get conflict
> with when it gets extracted.
> 
> So, we fix that mess by giving the top-most directory a recognisable
> name, based on the target tuple, which we also use as the name of the
> archive (suffixed with the usual +.tar.gz+.) We offer the user the
> possibility to override that default by specifying the +BR2_SDK_PREFIX+
> variable on the command line.
> 
> Since this is an output file, we place it in the images/ directory.
> 
> As some users expressed a very strong feeling that they do not want to
> generate a tarball at all, and that doing so would badly hurt their
> workflows [1], we actually prepare the SDK as was previously done, but
> under the new, intermediate rule 'prepare-sdk'. The existing 'sdk' rule
> obviously depend on that before generating the tarball.
> 
> We choose to make the existing rule to generate the tarball, and
> introduce a new rule to just prepare the SDK, rather than keep the
> existing rule as-is and introduce a new one to generate the tarball,
> because it makes sense to have the simplest rule do the correct thing,
> leaving advanced, power users use the longest command. If someone
> already had a wrapper that called 'sdk' and expected just the host
> directory to be prepared, then this is not broken; it just takes a bit
> longer (gzip is pretty fast).
> 
> Update the manual accordingly.
> 
> [0] https://en.wikipedia.org/wiki/Tar_(computing)#Tarbomb
> [1] http://lists.busybox.net/pipermail/buildroot/2018-June/thread.html#223377
>     and some messages in the ensuing thread...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Stefan Becker <chemobejk@gmail.com>
> Cc: Trent Piepho <tpiepho@impinj.com>
> 
> ---
> Changes v2 -> v3:
>   - drop the version from the prefix  (Stefan, Thomas)
>   - actually have 'sdk' depend on 'prepare-sdk'
>   - anonymise the generated tarball

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

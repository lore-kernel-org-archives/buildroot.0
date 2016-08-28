From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 12:48:25 +0200
Subject: [Buildroot] [PATCH 10/16 v3] core: introduce per br2-external ID
In-Reply-To: <20160827215951.GJ5755@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <a161d4b17c131b471418e4fa979aa73129ad102c.1468750623.git.yann.morin.1998@free.fr>
 <4bce70e5-7e9a-ef8b-6dc8-dbe2356df194@mind.be>
 <20160827215951.GJ5755@free.fr>
Message-ID: <20160828124825.0c68a5ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 23:59:51 +0200, Yann E. MORIN wrote:

> > > +			printf 'config BR2_EXTERNAL_%s\n' $(BR2_EXTERNAL_ID); \
> > > +			printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \  
> > 
> >  Why is this config still needed? It was there before because that's the only
> > way to use it in the 'source' statement, but now that we generate the external
> > Config.in, I don't think it's needed anymore. Which also removes the need for
> > the unquoting.  
> 
> Hmmm.. As far as I can see, it is still needed, because the Config.in
> files in the br2-external tree may want to include other Config.in
> files, no?
> 
> Like for example (with the variable renamed as per above):
> 
>     .../ext-tree/Config.in
>         source "$BR2_EXTERNAL_DIR_FOO/package/pkg-1/Config.in"
>         source "$BR2_EXTERNAL_DIR_FOO/package/pkg-2/Config.in"
> 
> So it is stil needed to have the path to each br2-external paths from
> Kconfig.
> 
> Unless I missed something?

No, I think you're right. I don't see how we can do without this config
variable, which is needed to communicate the BR2_EXTERNAL locations
from the make logic down to the Kconfig logic, in order to allow
Config.in files to include other Config.in files located in
BR2_EXTERNAL.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

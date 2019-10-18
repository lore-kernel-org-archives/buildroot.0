From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Oct 2019 10:15:04 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/brltty: fix build with expat
In-Reply-To: <20191017182213.GI14656@scaer>
References: <20191013124550.18413-1-fontaine.fabrice@gmail.com>
 <20191016231448.238c3348@windsurf.home>
 <20191017182213.GI14656@scaer>
Message-ID: <20191018101504.32d29c59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Oct 2019 20:22:13 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >    for variable in CC CFLAGS CXX CXXFLAGS LDFLAGS LDLIBS
> >    do
> >       unset "${variable}"
> >       variableForBuild="${variable}_FOR_BUILD"
> >       eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval "${variable}"'="${'"${variableForBuild}"'}"'
> >    done
> > 
> >    "${sourceRoot}/configure" \
> >       --disable-api \
> >       --disable-gpm \
> >       --disable-iconv \
> >       --disable-icu \
> > 
> > The issue is that for some reason the magic "eval" stuff doesn't do its
> > job. Indeed, if I change the ${sourceRoot}/configure invocation to:
> > 
> >    CC=${CC_FOR_BUILD} \
> >    CFLAGS=${CFLAGS_FOR_BUILD} \
> >    CXX=${CXX_FOR_BUILD} \
> >    CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
> >    LDFLAGS=${LDFLAGS_FOR_BUILD} \
> >    LDLIBS=${LDLIBS_FOR_BUILD} \
> >    "${sourceRoot}/configure" \
> >       --disable-api \
> >       --disable-gpm \  
> [--SNIP--]
> > Perhaps Yann can shed some light as to why the magic eval stuff doesn't
> > behave like it should.  
> 
> The difference I can spot is that in the first case, the 'unset' will
> cause the variables to be unset *and* unexported. Then the variables are
> (maybe) properly set by the eval, but they are not exported, and so are
> just not in the environment, and thus the sub-configure does not get
> them.

Ah, so:

	eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval "${variable}"'="${'"${variableForBuild}"'}"'

should be changed to:

	eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval export "${variable}"'="${'"${variableForBuild}"'}"'

 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

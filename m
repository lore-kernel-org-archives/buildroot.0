From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 21:45:21 +0200
Subject: [Buildroot] [PATCH] support/tests: allow properly indented
 config fragment
In-Reply-To: <420f45cf-1f44-d85f-4373-56ca3aded94a@mind.be>
References: <20170715224949.25598-1-yann.morin.1998@free.fr>
 <420f45cf-1f44-d85f-4373-56ca3aded94a@mind.be>
Message-ID: <20170718194521.GC2583@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-18 21:37 +0200, Arnout Vandecappelle spake thusly:
> On 16-07-17 00:49, Yann E. MORIN wrote:
> > Currently, defining a config fragment in the runtime test infra requires
> > that the fragment not to be indented. This is beark, and causes grievance
> > when looking at the code (e.g. to fix it).
> > 
> > Just strip out all leading spaces/tabs when writing the configuration
> > lines into the config file.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  support/testing/infra/builder.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> > index a475bb0a30..81735dec96 100644
> > --- a/support/testing/infra/builder.py
> > +++ b/support/testing/infra/builder.py
> > @@ -16,7 +16,8 @@ class Builder(object):
> >  
> >          config_file = os.path.join(self.builddir, ".config")
> >          with open(config_file, "w+") as cf:
> > -            cf.write(self.config)
> > +            for line in self.config.splitlines():
> > +                cf.write("{}\n".format(line.lstrip()))
> 
>  I like nitpicking :-)

Please nit-pick, python is not my cup of tea, you know well! ;-)

>  I would do this in BRTest instead of down here, so that self.config contains a
> correct config file. In fact, I would do it in its constructor instead of in
> setUp(), so that it is done only once even if a class has two test functions.

Meh, I have no real clue on how those class- or instance-scoped
variables play iwth each others... I think this is sad that we use
class-scoped config variable for the actual tests; they should be
instance-scoped instead, but that requires one to actually write an
__init__ function, so a classscoped is quicker to write.

Be if we ever want to derive a Test class into another, then we'll have
issues I guess...

But if I understand you correctly, you'd prefer (code elided for
brevity):

    class BRTest():
        def __init__(self):
            self.config = '\n'.join(map(str.lstrip, self.config.splitlines()))

Right?

>  I would also do it as a oneliner:
> 	self.config = '\n'.join(map(str.lstrip, self.config.splitlines()))
> but some people don't like oneliners :-)

Well, I prefer it, because it is rather self-explanatory. But I could
not have wrote it myself (I did not know about map() ).

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

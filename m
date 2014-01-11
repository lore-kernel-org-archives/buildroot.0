From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jan 2014 00:17:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-08
In-Reply-To: <20140110072938.27628d13@skate>
References: <20140109073009.A1897100CCB@stock.ovh.net>
 <20140109191427.GB3713@free.fr> <20140110072938.27628d13@skate>
Message-ID: <20140111231717.GD3391@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-10 07:29 +0800, Thomas Petazzoni spake thusly:
> On Thu, 9 Jan 2014 20:14:27 +0100, Yann E. MORIN wrote:
> > What happens is that ola runs the host-python to check if it can
> > 'import' the google.protobuf module.
> > 
> > Of course, this fails since google.protobuf is installed in target/ and
> > not in host/ (and we do not explicitly install a host-variant).
> 
> Correct. But what is odd is that this test was *not* failing before the
> migration to the Python infrastructure. I've started investigating
> this, but haven't found the reason why before the Python infra it was
> building OK, and not after the Python infra.
> 
> > There is a very simple trick^Whack we can use to fix this issue, either:
> >   - remove the test entirely, since we enforce the dependency from the
> >     Config.in an ola.mk, and thus we know google.protobuf will be
> >     present
> 
> The problem of this solution is that the patch you've done cannot be
> upstreamed, and therefore we would have to keep AUTORECONF = YES
> forever on this package. Maybe we can make the configure.ac test
> conditional on whether we're cross-compiling and push the patch
> upstream?

I understand your conerns, and in fact was not expecting the patch to be
applied that fast! ;-]

Now, if we add a check, I don;t know how to handle this.

After all, a check is here to detect whether a dependency is present or
missing. So we ehould expect the following from ./configure:

  - user did not request the feature: if the dependencies are present,
    it is enabled; if they are missign it is disabled;

  - user explicitly required the feature to be disabled: no problem,
    the feature is disabled and ./configure does not even need to check
    for the dependencies at all;

  - user explictly required the feature to be enabled: ./configure has
    to check if the dependencies are met, and abort if not.

Ideally, we should be able to check target dependencies, but this is not
possible with Python. So, while cross-compiling we can not check those
dependencies, what should we do?

  - user did not explictly reuired the feature: detect we're
    cross-compiling, and disable it (or enable it?)

  - user explixitly required the feature to be enabled: trust the user
    that the dependencies are met, without checking, at the risk of a
    mis-behaviour at build time, or worse, at runtime?

I really don't know what is best to do. I think I'll do the above and
try to get the patch upstreamed. Let's see what hey think about it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

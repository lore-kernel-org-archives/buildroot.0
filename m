From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 6 Feb 2018 11:17:08 +0100
Subject: [Buildroot] [PATCH 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
In-Reply-To: <20180205145450.GC2417@scaer>
References: <20180205142914.GR20598@australia.be.alcatel-lucent.com>
 <20180205145450.GC2417@scaer>
Message-ID: <20180206101708.GY20598@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 05, 2018 at 03:54:50PM +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> Quick review before in-depth review and testing...
> 
> On 2018-02-05 15:29 +0100, Thomas De Schampheleire spake thusly:
> > In current Buildroot, clashes occur between the variables _NAME and
> > _BASE_NAME for two packages called foo and foo-base, i.e.
> > 
> > Package foo:
> > FOO_NAME = foo
> > FOO_BASE_NAME = foo-1.2.3
> > 
> > Package foo-base:
> > FOO_BASE_NAME = foo-base
> > FOO_BASE_BASE_NAME = foo-base-4.5.6
> > 
> > where variable FOO_BASE_NAME is clashing between these two packages.
> > 
> > The problem is generic and can occur for a number of variables in Buildroot.
> > One solution is to use a different separator than '_' to separate the
> > package name from the rest of the variable name. For example:
> > FOO_NAME could become FOO.NAME, FOO-NAME, or something else.
> > Then, in the example we would have following non-clashing variables:
> > FOO.NAME
> > FOO.BASE_NAME
> > FOO_BASE.NAME
> > FOO_BASE.BASE_NAME
> 
> Another isadvantage is that those variables are not valid shell
> variables, so we ca=ould no longer use constructs like:
> 
>     eval $(make -s printvars VARS=FOO.BASE_NAME)
> 
> or similar...
> 
> But this is also an advantage, in that those variable won't accidentally
> leak into the environment of _CMDS...
> 
> But the disadvantage is more critical.
> 

An alternative that was mentioned which solves that issue is separating package
name from the rest by a double underscore, i.e.
FOO__NAME
FOO__BASE_NAME
FOO__RAW_BASE_NAME

This would still be acceptable by the shell.

From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 May 2019 10:53:50 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/pkg-meson: change to use
 upper-case package name as parameter
In-Reply-To: <20190502201436.6163-2-ps.report@gmx.net>
References: <20190502201436.6163-1-ps.report@gmx.net>
 <20190502201436.6163-2-ps.report@gmx.net>
Message-ID: <5953b99a-2cae-8a5e-55cf-4a254f483f6b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/05/2019 22:14, Peter Seiderer wrote:
> Change to use upper-case package name as parameter, rather than expect
> it from a variable.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - suggested by Arnout Vandecappelle

 We first need to get general agreement that this is the way to go.

 We currently have 158 instances of $(PKG). 5 of those are in package .mk files
that could just as well use the package name directly - but they're less
important. 7 are in various places outside of the package infra where it makes
complete sense to use $(PKG) because the package name is not statically "known".
About 40 are in the generic and other package infra rules, where it was
originally intended for. Roughly 100 are inside infra context where they can be
directly replaced with $(2). And then there are about 10 in the autotools infra
where it is used inside a hook, where we could choose to turn the hooks into
calls with $(1) == $($(PKG)_NAME) and $(2) == $(PKG).

 So, do we really want this churn? And does it make sense to begin with to
prefer $(2) over $(PKG)?

 Regards,
 Arnout

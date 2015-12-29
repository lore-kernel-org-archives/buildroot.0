From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:45:54 +0100
Subject: [Buildroot] [git commit] graph-depends: optimize
	remove_transitive_deps()
In-Reply-To: <20151229222734.A219F826ED@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 29 Dec 2015 23:26:22 +0100")
References: <20151229222734.A219F826ED@busybox.osuosl.org>
Message-ID: <87y4ccc1r1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> commit: http://git.buildroot.net/buildroot/commit/?id=5ed60cee1ed5f8a8e93866fc9db9ff890184afce
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

> For large configurations, the execution time of
> remove_transitive_deps() becomes really high, due to the number of
> nested loops + the is_dep() function being recursive.

>  # This function return True if pkg is a dependency (direct or
>  # transitive) of pkg2, dependencies being listed in the deps
>  # dictionary. Returns False otherwise.
> -def is_dep(pkg,pkg2,deps):
> -    if pkg2 in deps:
> +# This is the un-cached version.
> +def is_dep_uncached(pkg,pkg2,deps):
> +    try:
>          for p in deps[pkg2]:
>              if pkg == p:
>                  return True
>              if is_dep(pkg,p,deps):
>                  return True
> +    except KeyError:
> +        pass
>      return False
 
> +# See is_dep_full() above; this is the cached version.
> +def is_dep(pkg,pkg2,deps):

I believe that comment should refer to is_dep_uncached() instead. Fixed
in git.

-- 
Bye, Peter Korsgaard

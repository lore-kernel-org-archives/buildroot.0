From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 20 Jul 2017 07:49:48 +0200
Subject: [Buildroot] [PATCH 1/2] scanpypi: don't pass any arguments to
	main()
In-Reply-To: <20170720052638.32122-1-alexey.roslyakov@gmail.com>
References: <20170720052638.32122-1-alexey.roslyakov@gmail.com>
Message-ID: <CAGm1_kudhDGowTM8gXwLSq25n7gHnioESoFSx9O_=2F7_atysQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Thu, Jul 20, 2017 at 7:26 AM, Alexey Roslyakov
<alexey.roslyakov@gmail.com> wrote:
> 'if __name__ == "__main__"' idiom typically calls main function that
> doesn't take any arguments in most cases. We shouldn't pass any tuple to
> it.
> I've tested the script with python-idna-2.5 and now it works with this
> little change.
>
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>

Good catch! I've tested it with cbor and it is now working like a charm.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  utils/scanpypi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index bb3899241b..9abf3c4139 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -255,12 +255,12 @@ class BuildrootPackage():
>              # called through the if __name__ == '__main__' directive.
>              # In this case, we can only pray that it is called through a
>              # function called main() in setup.py.
> -            setup.main([]) # Will raise AttributeError if not found
> +            setup.main() # Will raise AttributeError if not found
>              self.setup_metadata = self.setup_args[self.metadata_name]
>          # Here we must remove the module the hard way.
>          # We must do this because of a very specific case: if a package calls
>          # setup from the __main__ but does not come with a 'main()' function,
> -        # for some reason setup.main([]) will successfully call the main
> +        # for some reason setup.main() will successfully call the main
>          # function of a previous package...
>          sys.modules.pop('setup',None)
>          del setup
> --
> 2.13.0
>

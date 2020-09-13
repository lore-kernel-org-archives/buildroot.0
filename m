From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2020 11:03:40 +0200
Subject: [Buildroot] [PATCH v4 2/2] support/scripts/pycompile: add
 --verbose option
In-Reply-To: <20200910083252.7102-3-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910083252.7102-1-robin.jarry@6wind.com>
 <20200910083252.7102-3-robin.jarry@6wind.com>
Message-ID: <20200913090340.GM10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robin, All,

On 2020-09-10 10:32 +0200, Robin Jarry spake thusly:
> Add a new option that prints the (runtime) path of compiled .py files
> when VERBOSE=1 is set.
> 
> Signed-off-by: Robin Jarry <robin.jarry@6wind.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python/python.mk     |  1 +
>  package/python3/python3.mk   |  1 +
>  support/scripts/pycompile.py | 11 +++++++++--
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index 3fe5ecd00462..4bff5f0c7c66 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -263,6 +263,7 @@ define PYTHON_CREATE_PYC_FILES
>  	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
>  		$(TOPDIR)/support/scripts/pycompile.py \
>  		$(if $(BR2_REPRODUCIBLE),--force) \
> +		$(if $(VERBOSE),--verbose) \
>  		--strip-root $(TARGET_DIR) \
>  		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
>  endef
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 4c8a12c7a3ad..52c548accc9b 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -280,6 +280,7 @@ define PYTHON3_CREATE_PYC_FILES
>  	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
>  		$(TOPDIR)/support/scripts/pycompile.py \
>  		$(if $(BR2_REPRODUCIBLE),--force) \
> +		$(if $(VERBOSE),--verbose) \
>  		--strip-root $(TARGET_DIR) \
>  		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
>  endef
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index 04193f4a02c2..55c09fe688d6 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -31,7 +31,7 @@ else:
>      PYC_HEADER_ARGS += (0,)  # zero hash, we use timestamp invalidation
>  
>  
> -def compile_one(host_path, strip_root=None, force=False):
> +def compile_one(host_path, strip_root=None, force=False, verbose=False):
>      """
>      Compile a .py file into a .pyc file located next to it.
>  
> @@ -42,6 +42,8 @@ def compile_one(host_path, strip_root=None, force=False):
>          files.
>      :arg force:
>          Recompile even if already up-to-date.
> +    :arg verbose:
> +        Print compiled file paths.
>      """
>      if os.path.islink(host_path) or not os.path.isfile(host_path):
>          return  # only compile real files
> @@ -69,6 +71,9 @@ def compile_one(host_path, strip_root=None, force=False):
>      else:
>          runtime_path = host_path
>  
> +    if verbose:
> +        print("  PYC  {}".format(runtime_path))
> +
>      # will raise an error if the file cannot be compiled
>      py_compile.compile(host_path, cfile=host_path + "c",
>                         dfile=runtime_path, doraise=True)
> @@ -95,6 +100,8 @@ def main():
>                          """)
>      parser.add_argument("--force", action="store_true",
>                          help="Force compilation even if already compiled")
> +    parser.add_argument("--verbose", action="store_true",
> +                        help="Print compiled files")
>  
>      args = parser.parse_args()
>  
> @@ -105,7 +112,7 @@ def main():
>              for parent, _, files in os.walk(d):
>                  for f in files:
>                      compile_one(os.path.join(parent, f), args.strip_root,
> -                                args.force)
> +                                args.force, args.verbose)
>  
>      except Exception as e:
>          print("error: {}".format(e))
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

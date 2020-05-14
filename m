From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 14 May 2020 16:33:28 +0200
Subject: [Buildroot] [PATCH 1/5] support/scripts/bl-toolchain-gen: add
 new script to support Bootlin toolchains
In-Reply-To: <20200514125304.1106087-2-thomas.petazzoni@bootlin.com>
References: <20200514125304.1106087-1-thomas.petazzoni@bootlin.com>
 <20200514125304.1106087-2-thomas.petazzoni@bootlin.com>
Message-ID: <0d73976c-5593-60a2-a7a6-9f1aa5e9b0be@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

First of all, thank you a lot for integrating these toolchains directly 
into Buildroot !

I left some comments below, mostly for cosmetic reasons in Python.

On 14/05/20 14:52, Thomas Petazzoni wrote:

[--SNIP--]

> ---
>   support/scripts/bl-toolchains-gen | 472 ++++++++++++++++++++++++++++++

Most of the other scripts in support/scripts have a name in the form 
<verb>-<details> (ex: check-bin-arch). As a matter of consistency, I 
would rename this one to gen-bootlin-toolchains.

>   1 file changed, 472 insertions(+)
>   create mode 100755 support/scripts/bl-toolchains-gen

[--SNIP--]

> +
> +class Toolchain:
> +    def __init__(self, arch, libc, variant, version):
> +        self.arch = arch
> +        self.libc = libc
> +        self.variant = variant
> +        self.version = version
> +        self.fname_prefix = "%s--%s--%s-%s" % (self.arch, self.libc, self.variant, self.version)
> +        self.option_name = "BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_%s_%s_%s" % \
> +            (self.arch.replace("-", "_").upper(), self.libc.upper(), self.variant.replace("-", "_").upper())
> +        self.fragment = requests.get(self.fragment_url()).text.split("\n")
> +        self.sha256 = requests.get(self.hash_url()).text.split(" ")[0]
> +
> +    def tarball_url(self):
> +        return os.path.join(BASE_URL, self.arch, "tarballs",
> +                            self.fname_prefix + ".tar.bz2")
> +
> +    def hash_url(self):
> +        return os.path.join(BASE_URL, self.arch, "tarballs",
> +                            self.fname_prefix + ".sha256")
> +
> +    def fragment_url(self):
> +        return os.path.join(BASE_URL, self.arch, "fragments",
> +                            self.fname_prefix + ".frag")

It's nicer if you mark the 3 above methods as properties 
(https://docs.python.org/3/library/functions.html#property), and you can 
then use them as "attributes":

class Toolchain:
     # ...
     @property
     def fragment_url(self):
         return ...

print(toolchain.fragment_url)

> +
> +    def gen_config_in_options(self, f):
> +        f.write("config %s\n" % self.option_name)
> +        f.write("\tbool \"%s %s %s %s\"\n" %
> +                (self.arch, self.libc, self.variant, self.version))
> +        for c in arches[self.arch]['conditions']:
> +            f.write("\tdepends on %s\n" % c)
> +        selects = []
> +        for frag in self.fragment:
> +            # libc type
> +            if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC"):
> +                selects.append("BR2_TOOLCHAIN_EXTERNAL_UCLIBC")
> +            elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
> +                selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
> +                # all glibc toolchains have RPC support
> +                selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
> +            elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
> +                selects.append("BR2_TOOLCHAIN_EXTERNAL_MUSL")
> +
> +            # gcc version
> +            if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_GCC_"):
> +                m = re.match("^BR2_TOOLCHAIN_EXTERNAL_GCC_([0-9_]*)=y$", frag)
> +                if m is None:
> +                    print("ERROR: cannot get gcc version for toolchain %s" % self.fname_prefix)
> +                    sys.exit(1)
> +                selects.append("BR2_TOOLCHAIN_GCC_AT_LEAST_%s" % m[1])

Shorter (and removes the need to import sys):

assert m, "Cannot get gcc version for toolchain %s" % self.fname_prefix

> +
> +            # kernel headers version
> +            if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_HEADERS_"):
> +                m = re.match("^BR2_TOOLCHAIN_EXTERNAL_HEADERS_([0-9_]*)=y$", frag)
> +                if m is None:
> +                    print("ERROR: cannot get kernel headers version for toolchain %s" % self.fname_prefix)
> +                    sys.exit(1)
Same

[--SNIP--]

> +
> +        f.write("\thelp\n")
> +
> +        desc = "Bootlin toolchain for the %s architecture, using the %s C library" % \
> +            (self.arch, self.libc)

Maybe add a little description about bleeding-edge/stable here ?

> +
> +        f.write(textwrap.fill(desc, width=62, initial_indent="\t  ", subsequent_indent="\t  ") + "\n")
> +        f.write("\n")
> +        f.write("\t  https://toolchains.bootlin.com/\n")

[--SNIP--]

> +def get_toolchains():
> +    toolchains = list()
> +    for arch, details in arches.items():
> +        print(arch)
> +        url = os.path.join(BASE_URL, arch, "available_toolchains")
> +        cwd, listing = htmllistparse.fetch_listing(url)
> +        fnames = [f.name for f in listing]
> +        # Sorting the list so we have the most recent version last
> +        fnames.sort()
> +        # This dict will allow us to keep only the latest version for
> +        # each toolchain.
> +        tmp = dict()
> +        for fname in fnames:
> +            parts = fname.split('--')
> +            if parts[0] != arch:
> +                print("FATAL: arch does not match: %s vs. %s" % (parts[0], arch))
> +                sys.exit(1)

Again:
assert parts[0] == arch, "Arch does not match: %s vs %s" % (parts[0], arch)

> +            libc = parts[1]
> +            if parts[2].startswith("stable-"):
> +                variant = "stable"
> +                version = parts[2][len("stable-"):]
> +            elif parts[2].startswith("bleeding-edge-"):
> +                variant = "bleeding-edge"
> +                version = parts[2][len("bleeding-edge-"):]
> +            tmp[(arch, libc, variant)] = version
> +
> +        for k, v in tmp.items():
> +            t = Toolchain(k[0], k[1], k[2], v)
> +            toolchains.append(t)
> +
> +    return toolchains

return [Toolchain(k[0], k[1], k[2], v) for k, v in tmp.items()]

[--SNIP--]

> +def gen_hash(toolchains, fpath):
> +    with open(fpath, "w") as f:
> +        for toolchain in toolchains:
> +            toolchain.gen_hash(f)
> +


Could you also add the comment stating that this file is auto-generated 
here ?

By the way, since all the files having this comment use the "# comment" 
syntax, you could even have this defined in a global variable at the top 
of the script. I would also add the time of generation in this comment:

AUTO_GENERATED_COMMENT = """# This file is auto-generated by ... on %s
# Do not edit

""" % datetime.now().isoformat()

> +
> +def gen_runtime_test(toolchains, fpath):
> +    with open(fpath, "w") as f:
> +        f.write("from tests.toolchain.test_external import TestExternalToolchain\n")
> +        for toolchain in toolchains:
> +            toolchain.gen_test(f)
> +

Same here

> +
> +def gen_toolchains(toolchains):
> +    maindir = "toolchain/toolchain-external/toolchain-external-bootlin"
> +    gen_config_in_options(toolchains, os.path.join(maindir, "Config.in.options"))
> +    gen_mk(toolchains, os.path.join(maindir, "toolchain-external-bootlin.mk"))
> +    gen_hash(toolchains, os.path.join(maindir, "toolchain-external-bootlin.hash"))
> +    gen_runtime_test(toolchains,
> +                     os.path.join("support", "testing", "tests", "toolchain", "test_external_bootlin.py"))
> +
> +
> +toolchains = get_toolchains()
> +gen_toolchains(toolchains)
> 

Kind regards,

Titouan

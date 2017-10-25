From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Oct 2017 12:10:23 +0200
Subject: [Buildroot] [WIP 0/2] gobject-introspection
In-Reply-To: <20171020200856.19406-1-Adamduskett@outlook.com>
References: <20171020200856.19406-1-Adamduskett@outlook.com>
Message-ID: <0dddc375-85ee-5222-c90d-cfda74e1e601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-10-17 22:08, Adam Duskett wrote:
> Gstreamer will now fail to build!
> Why? Gstreamer looks for an introspection library during the configure
> stage, and if it finds it, attempts to use it.
> Because some library paths not being making it to the introspection
> compiler, it will now fail to build with linking errors! Oh no!
> 
> In Yocto, you can call out:
> export GIR_EXTRA_LIBS_PATH="path" 
> (see meta/recipes-multimedia/gstreamer/gstreamer1.0.inc for an example)
> in the recipe file, which will be then get passed to g-ir-scanner-qemuwrapper,
> which will then set the environment variable LD_LIBRARY_PATH to the value of
> GIR_EXTRA_LIBS_PATH, whcih will then call g-ir-scanner, which will then
> call the functions in the script entitled "ccompiler.py" in the host directory.
> which will then resolve the library paths properly based off of the
> LD_LIBRARY_PATH variable. It's a very easy and clean solution to the problem.
> 
> However, this isn't possible with BuildRoot because a script called from
> a GNU Makefile can't change the parent environment, and so the build
> will fail miserably.

 So setting

GSTREAMER_MAKE_ENV = GIR_EXTRA_LIBS_PATH="path"

doesn't work? I wonder why not...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

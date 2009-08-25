From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Tue, 25 Aug 2009 22:49:54 +0200
Subject: [Buildroot] how to build code checked out from a version
 control system
In-Reply-To: <1251195956.10767.16.camel@sven>
References: <1251195956.10767.16.camel@sven>
Message-ID: <1251233394.8504.19.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 25 ao?t 2009 ? 12:25 +0200, Sven Neumann a ?crit :
> Hi,
> 
> we have some code there that lives in a Bazaar repository and that we
> would like to build from within our buildroot setup. I have created
> buildroot packages for these modules, but somehow I ended up with lots
> of hacks and things are still not working properly. I wonder if there is
> some example or documentation that I should have a look at. Is anyone
> doing something similar and could show me how to do this properly?
> 

Hi Sven,

I'm working with buildroot in a similar way than you do.

Currently I'm doing everything myself :

Usually I first compile everything from the last buildroot branch, then
I remove the packages I want to hack on manually from the build
directory, replacing them with the a git repository of the package
(initialized locally or cloned from the package's official repository).
Each time I'm making a change to the build directory of the package I
remove some of the .stamp_* files (usally the
built/configure/autoconfigure) and the stamp installation file and rerun
make from the top directory of buildroot.

Once everything is compiled, and once the image generated (in a tar
archive), I just have to untar the archive in my nfs shared directory
and reboot my board/qemu.

This way I can rebuild the package I'm working on and quickly run some
tests just by removing 2/3 files and run make.

If I get some time to work on buildroot, my plans are to automatize this
process from the top directory of buildroot by running something like :

make configure-PACKAGENAME
make build-PACKAGENAME
make install-PACKAGENAME

etc...

And maybe add some make commands to automaticly "gitize" a source
package to keep track of modifications.

Nothing to complicated ;)


-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>

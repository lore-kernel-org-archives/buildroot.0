From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:29:01 +0200
Subject: [Buildroot] [PATCH 1/2] core.br2-external: fix reporting errors
In-Reply-To: <22d695ca68ad664cbe5af125683b61c80f828d35.1590183628.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 22 May 2020 23:40:50 +0200")
References: <cover.1590183628.git.yann.morin.1998@free.fr>
 <22d695ca68ad664cbe5af125683b61c80f828d35.1590183628.git.yann.morin.1998@free.fr>
Message-ID: <87eepc1ssi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When a br2-external tree has an issue, e.g. a missing file, or does not
 > have a name, or the name uses invalid cahrs, we report that condition by
 > setting the variable BR2_EXTERNAL_ERROR.

 > That variable is defined in the script support/scripts/br2-external,
 > which outputs it on stdout, and checked by the Makefile.

 > Before d027cd75d09, stdout was explicitly redirected to the generated
 > .mk file, with   exec >"${ofile}"   as the Makefile and Kconfig
 > fragments were generated each with their own call to the script, and o
 > the validation phase would emit the BR2_EXTERNAL_ERROR variable in the
 > Makefile fragment.

 > But with d027cd75d09, both the Makefile and Kconfig fragmetns were now
 > generated with a single call to the script, and as such the semantics of
 > the scripts changed, and only each of the actual generators, do_mk and
 > do_kconfig, ahd their out put redirected. Which left do_validate with
 > the default stdout. Which would emit BR2_EXTERNAL_ERROR on stdout.

 > In turn, the stdout of the script would be interpreted by as part of the
 > Makefile. But this does not end up very well when a br2-external tree
 > indeed has an error:

 >     Makefile:184: *** multiple target patterns.  Stop.

 > So we must redirect the output of the validation step to the
 > Makefile fragment.

 > Note that we don't need to append in do_mk, and we can do an overwrite
 > redirection: if we go so far as to call do_mk, it means there was no
 > error, and thus the fragment is empty.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard

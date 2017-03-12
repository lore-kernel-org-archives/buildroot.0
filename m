From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 19:21:50 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <20170312180508.GE3739@free.fr>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170312180508.GE3739@free.fr>
Message-ID: <20170312182150.GF3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-12 19:05 +0100, Yann E. MORIN spake thusly:
> On 2017-03-12 18:49 +0100, Thomas Petazzoni spake thusly:
> > +for f in $(find ${TARGET_DIR}/{usr/,}{bin,lib,sbin} -type f) ; do

So, as I said earlier:
  - cd in TARGET_DIR first;
  - exclude .lib/firmware and /usr/lib/firmware

    cd "${TARGET_DIR}"
    find ./{usr/,}{bin,lib,sbin} \
        -type f \( \( -path './lib/firmware/*' -o -path './usr/lib/firmware*' \) \ 
                    -prune -o -print \)

Regards,
Yann E. MORIN.

> > +    # Skip non-ELF files
> > +    if ! file -b ${f} | grep -q "ELF " ; then
> > +	continue
> 
> You have a mix of space-and-tab indetation. Please use only one or
> the other (I favour spaces, but I'm happy with tabs as long as it is
> consistent).
> 
> > +    fi
> > +
> > +    # Get architecture using readelf
> > +    farchname=$(${TARGET_CROSS}readelf -h ${f} | \
> > +		       grep '^  Machine:' | \
> > +		       sed 's/^  Machine: *\(.*\)/\1/')
> > +
> > +    if test "${farchname}" != "${READELF_ARCH_NAME}" ; then
> 
> [0] because we could then point to the offending package:
> 
>         pkg="$( sed -r -e "\:^([^,]+),${f}$:!d; s//\1/;" "${BUILD_DIR}/packages-file-list.txt" )"
> 
> Of course, do not forget to pass BUILD_DIR when calling the script. ;-)
> 
> > +	echo "ERROR: ${f} architecture is '${farchname}', should be '${READELF_ARCH_NAME}'"
> 
>     printf 'ERROR: %s (from %s) architecture is %s, should be %s\n' \
>         "${f}" "${pkg}" "${farchname}" "${READELF_ARCH_NAME}"
> 
> Regards,
> Yann E. MORIN.
> 
> > +	exitcode=1
> > +    fi
> > +done
> > +
> > +exit ${exitcode}
> > -- 
> > 2.7.4
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 10:49:47 +0200
Subject: [Buildroot] [PATCH 3/5] support/download: simplify the
	local-files helper
In-Reply-To: <bbb8dd812cfbb3025d3796494ce7304f16c6ab6a.1404681878.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 6 Jul 2014 23:27:14 +0200")
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <bbb8dd812cfbb3025d3796494ce7304f16c6ab6a.1404681878.git.yann.morin.1998@free.fr>
Message-ID: <874mys1bh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the local-files download helper behaves like all the other
 > download helpers, by first copying into the BUILD_DIR, then to
 > BR2_DL_DIR, and then rename the final file.

 > This does two copies, for the sake of using the LOCALFILES command.

 > Just get rid of the intermediate copy to BUILD_DIR. Instead, directly
 > copy to the final temp file and rename that.

 > This does a single copy, but we lose the file access mode, so we just
 > reinstate them (in case it's a self-extracting executable used in a
 > br2-external package, for example.)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>


 > +++ b/support/download/cp
 > @@ -8,20 +8,19 @@ set -e
 >  #   $1: source file
 >  #   $2: output file
 >  # And this environment:
 > -#   LOCALFILES: the cp command to call
 > +#   (nothing special)
 
 >  source="${1}"
 >  output="${2}"
 
 > -tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
 >  tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 >  ret=1
 > -if ${LOCALFILES} "${source}" "${tmp_dl}"; then
 > -    if cat "${tmp_dl}" >"${tmp_output}"; then
 > -        mv "${tmp_output}" "${output}"
 > -        ret=0
 > -    fi
 > +if cat "${source}" >"${tmp_output}"; then
 > +    mode="$( stat -c '%a' "${source}" )"
 > +    chmod "${mode}" "${tmp_output}"
 > +    mv "${tmp_output}" "${output}"
 > +    ret=0

Similar to Arnouts comments, wouldn't cp -a be easier?


-- 
Bye, Peter Korsgaard

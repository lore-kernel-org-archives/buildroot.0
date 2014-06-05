From: =?UTF-8?B?UGFzY2FsIEjDvHJzdA==?= <pascal.huerst@gmail.com>
Date: Thu, 05 Jun 2014 22:21:50 +0200
Subject: [Buildroot] [PATCH V4 1/2] google-breakpad: new package
In-Reply-To: <20140604195302.GF3325@free.fr>
References: <1401881573-12921-1-git-send-email-pascal.huerst@gmail.com>
 <1401881573-12921-2-git-send-email-pascal.huerst@gmail.com>
 <20140604195302.GF3325@free.fr>
Message-ID: <5390D15E.3070503@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello Yann, all,

[snip]

>> diff --git a/package/google-breakpad/google-breakpad-gen-syms.sh 
>> b/package/google-breakpad/google-breakpad-gen-syms.sh new file 
>> mode 100755 index 0000000..e082875 --- /dev/null +++ 
>> b/package/google-breakpad/google-breakpad-gen-syms.sh
> 
> This script should have been part of your next patch.
> 
>> @@ -0,0 +1,37 @@ +#!/bin/sh + +STAGING_DIR=$1 +HOST_DIR=$2
> 
> Passing HOST_DIR is not needed. You should call the script with the
> EXTRA_ENV which contains the PATH variable, in the Makefile:
> 
> $(EXTRA_ENV) your-script your-args
> 
>> +INCLUDE_FILES=$3 + +# Search for files we want to dump symbols 
>> of +FIND_CMD="find $STAGING_DIR -name \"\""
> 
> Ugly hack. It took me a moment to understand what you wanted. See 
> below for a suggested better way to achieve the same result.
> 
> Besides, not all package install their files in staging. You
> should use TARGET_DIR instead.

Aren't all binaries in TARGET_DIR stripped? If so, it doesn't really
make sense to run gen_syms in TARGET_DIR.

>> +for INCLUDE_FILE in $INCLUDE_FILES; do +	FIND_CMD="$FIND_CMD -o 
>> -name \"$INCLUDE_FILE\"" +done
> 
> This does not handle the case where two files would have the same 
> basename but reside in different directories. For example: 
> /usr/bin/my-exec        <- ELF file /data/config/my-exec    <- 
> database
> 
> Please state that INCLUDE_FILES should be relative to 
> $(TARGET_DIR). That way, we guarantee breakpad is not run against 
> unwanted files, which would otherwise confuse the unsuspecting 
> user.
> 
>> +# Create directory structure 
>> +SYMBOLS_DIR=$STAGING_DIR/usr/share/google-breakpad-symbols + 
>> +mkdir -p $SYMBOLS_DIR/tmp + +for BIN_PATH in $(eval $FIND_CMD); 
>> do +	BIN=$(basename $BIN_PATH); +	SYM=$BIN.sym; + + 
>> $HOST_DIR/usr/bin/dump_syms $BIN_PATH > $SYMBOLS_DIR/tmp/$SYM 
>> 2>/dev/null; + +	if [ $? -eq 0 ]; then +		HASH=$(head -n1 
>> $SYMBOLS_DIR/tmp/$SYM | cut -d ' ' -f 4); +		mkdir -p 
>> $SYMBOLS_DIR/$BIN/$HASH +		mv $SYMBOLS_DIR/tmp/$SYM 
>> $SYMBOLS_DIR/$BIN/$HASH; +	else +		rm -f $SYMBOLS_DIR/tmp/$SYM + 
>> echo "Can not dump symbols of $BIN for google-breakpad!" +	fi 
>> +done + +rm -Rf $SYMBOLS_DIR/tmp + +exit 0
> 
> 'exit 0' is not needed.
> 
> What about the following (untested)?
> 
> #!/bin/sh STAGING_DIR="${1}" TARGET_DIR="${2}" shift 2
> 
> symbols_dir="${STAGING_DIR}/usr/share/google-breakpad-symbols" rm 
> -rf "${symbols_dir}" mkdir -p "${symbols_dir}/tmp"
> 
> cd "${TARGET_DIR}" for file in $(ls -1d "${@}"); do if [ -d 
> "${file}" ]; then printf "Error: '%s' is a directory\n" "${file}"
>> &2 exit 1 fi if dump_syms "${file}" 
>> "${symbols_dir}/tmp/tmp.syms"; then sha1="$( printf "%s"
>> "${file}"
> |sha1sum |awk '{print $1}' )" mv "${symbols_dir}/tmp/tmp.syms" 
> "${symbols_dir}/${sha1}.sym" printf "%s %s\n" "${sha1}" "${file}"
>>> "${symbols_dir}/hashes.list" else printf "Error dumping
>>> symbols
> for: '%s'\n" "${file}" >&2 exit 1 fi done rm -rf 
> "${symbols_dir}/tmp"
> 
> It is more concise, and handles mutilple files with the same name, 
> and packages which do not install their files in STAGING_DIR.
> 
> ${1} and ${2} are the staging and target dirs, so we store them
> and shift, so the remaining arguments are all the paths to files
> we want to extract symbols from.
> 
> We $(ls -1d) the args, in case one of them is a glob.
> 
> A directory argument is invalid. The user should use a glob.
> 
> We can use 'dump_syms' without full path since it is guaranteed to 
> be in the PATH, as exported by the EXTRA_ENV variable used above.
> 
> We store the symbols in a file named after the sha1 of the 
> filename. We could use the symbols file's hash if it is a strong 
> enough hash (eg sha1 or above, but since I don;t know what hash 
> dump_syms generates, I can't trust it to not collide). This allows 
> to store symbols for file with the same name in different 
> directories.
> 
> We store the correspondence {sha1,file} in a text file, so it is 
> easy to retrieve the filename from a sha1, and conversely.
> 
> We exit as soon as we can't extract symbols from a file, as we
> want to catch it as a failure, instead of ignoring it.

Ok, I understand your concerns and the find-call is by far not
perfect, but the whole reason why I setup the directory structure that
way, is because googles minidump-stackwalk expects it that way. See:

https://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide#Producing_symbols_for_your_application


[snip]

regards
pascal
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEUEARECAAYFAlOQ0VgACgkQo7eFcXQQ8U0B0QCfQbjF0nqWHLOcwr4AyiXLXDeL
BOIAl3P1IpV/hcSaXIEZpguemMN+RgU=
=apjR
-----END PGP SIGNATURE-----

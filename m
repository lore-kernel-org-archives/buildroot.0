From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Jun 2016 00:05:44 +0200
Subject: [Buildroot] File path name and bash pattern matching
Message-ID: <20160618000544.14d823af@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

some fun with a patch file name containing '?' and bash pattern matching, e.g:

	$ make openssl-dirclean

Rename the original patch file substituting '?' with '_':

	$ mv dl/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d dl/openssl-1.0.2d-parallel-build.patch_id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d

Buildroot fails with misleading error message:

	$ make
  umask 0022 && make -C <some_path>/build O=<some_path>/build/. 
  openssl-1.0.2h.tar.gz: OK (sha256: 1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919)
  ERROR: No hash found for openssl-1.0.2d-parallel-build.patch_id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
  ERROR: No hash found for openssl-1.0.2d-parallel-build.patch_id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
  package/pkg-generic.mk:113: recipe for target '<some_path>/build/openssl-1.0.2h/.stamp_downloaded' failed
  make[1]: *** [<some_path>/build/openssl-1.0.2h/.stamp_downloaded] Error 1
  Makefile:16: recipe for target '_all' failed
  make: *** [_all] Error 2

Removing the renamed patch file fixes the build:

	$ rm dl/openssl-1.0.2d-parallel-build.patch_id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
	$ make
...starts with a fresh download of the missing patch file...

Which is the best way to avoid bash pattern matching here (in 'support/download/dl-wrapper')?

Regards,
Peter

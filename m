From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 10 Apr 2021 09:23:55 -0300
Subject: [Buildroot] [PATCH v2 0/2] Add support to OCI images
Message-ID: <20210410122357.12641-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set adds support to OCI images.

The OCI image format is a specification for container images defined and
maintained as an open standard by the Open Container Initiative [1].

To generate the image according to the specification [2], a tool called
sloci-image is used.

The OCI image is generated (by default) in a directory called rootfs-oci:

$ ls output/images/rootfs-oci/
blobs  index.json  oci-layout

It can be pushed to a container registry using tools like skopeo:

$ skopeo copy --dest-creds <user>:<pass> oci:rootfs-oci:<tag> \
         docker://<user>/<image>[:tag]

And then we can pull/run the container image with tools like docker:

$ docker run --rm -it <user>/<image>[:tag]

[1] https://opencontainers.org/
[2] https://github.com/opencontainers/image-spec/blob/master/spec.md

---
Changes v1 -> v2:
  - bump sloci-image version to 0.1.1 abd drop patch applied upstream
  - improve usage comments
  - fix check-package warnings

---
Sergio Prado (2):
  package/sloci-image: new host package
  oci: add new filesystem type

 DEVELOPERS                           |  1 +
 fs/Config.in                         |  1 +
 fs/oci/Config.in                     | 88 +++++++++++++++++++++++++
 fs/oci/oci.mk                        | 99 ++++++++++++++++++++++++++++
 package/Config.in.host               |  1 +
 package/sloci-image/Config.in.host   |  7 ++
 package/sloci-image/sloci-image.hash |  5 ++
 package/sloci-image/sloci-image.mk   | 19 ++++++
 8 files changed, 221 insertions(+)
 create mode 100644 fs/oci/Config.in
 create mode 100644 fs/oci/oci.mk
 create mode 100644 package/sloci-image/Config.in.host
 create mode 100644 package/sloci-image/sloci-image.hash
 create mode 100644 package/sloci-image/sloci-image.mk

-- 
2.17.1
